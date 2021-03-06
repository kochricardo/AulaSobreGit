unit uRelacaoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaPadrao, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls, uRotinasGenericas, ExtCtrls,ComObj, uAuxiliarCompras,Printers,
  uProduto, uSistemaCompras,Strutils, SHELLAPI,SqlExpr;

type
  T_frmRelacaoPedidos = class(T_frmPadrao)
    _cdsPedido: TClientDataSet;
    _dspedido: TDataSource;
    _dtpDtInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    _edtNumeroComprador: TEdit;
    Label3: TLabel;
    _btnPesquisa: TBitBtn;
    Label4: TLabel;
    _edtNumeroFornecedor: TEdit;
    _rgStatus: TRadioGroup;
    _edtTotalItens: TEdit;
    _cdsPedidoNR_TOTAL_ITENS: TAggregateField;
    Label5: TLabel;
    _edtNumerosUnidades: TEdit;
    Label6: TLabel;
    _cdsPedidoNR_TOTAL_UNIDADES: TAggregateField;
    _edtTotalPedidoCompra: TEdit;
    Label7: TLabel;
    _edtTotalPedidoForncedor: TEdit;
    Label8: TLabel;
    _cdsPedidoVL_PEDIDO_FORNECEDOR: TAggregateField;
    _cdsPedidoVL_PEDIDO_CUSTO: TAggregateField;
    GroupBox4: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    Label9: TLabel;
    Label10: TLabel;
    _edtNumeroItensFaturado: TEdit;
    _edtQuantidadeFaturada: TEdit;
    _cdsPedidoNR_UNIDADES_FAT: TAggregateField;
    _cdsPedidoQT_UNIDADES_FAT: TAggregateField;
    Label11: TLabel;
    Label12: TLabel;
    _edtTotaFaturadoCompra: TEdit;
    _edtTotalFaturaroFornec: TEdit;
    _cdsPedidoVL_FATURADO_CUSTO: TAggregateField;
    _cdsPedidoVL_FATURADO_FORNEC: TAggregateField;
    _btnExcelPedido: TBitBtn;
    _cdsCondicaoPagamentos: TClientDataSet;
    _cdsCondicaoPagamentosNR_PARCELAS: TAutoIncField;
    _cdsCondicaoPagamentosNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentosPC_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosVL_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosDT_PAGAMENTOS: TDateField;
    DBGrid3: TDBGrid;
    _dsCondicaoPagamentos: TDataSource;
    _btnImprimir: TBitBtn;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _cbxListaPreco: TComboBox;
    Label15: TLabel;
    _rgFiltroItem: TRadioGroup;
    _grbAlerta: TGroupBox;
    Label13: TLabel;
    _chkSomenteItemAtivos: TCheckBox;
    _cdsPedidoVL_PED_LIQUIDO: TAggregateField;
    _cdsPedidoVL_FATURADO_LIQUIDO: TAggregateField;
    _edtTotalPedidoLiquido: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    _edtNrPedido: TEdit;
    _chkPedidoOCD: TCheckBox;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _edtCodigoProduto: TEdit;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    _cdsTabelaPreco: TClientDataSet;
    _cdsItemListaPreco: TClientDataSet;
    procedure _btnPesquisa1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dspedidoDataChange(Sender: TObject; Field: TField);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _btnExcelPedidoClick(Sender: TObject);
    procedure _btnImprimirClick(Sender: TObject);
    procedure _dbgItemPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgItemPedidoTitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnPesquisaClick(Sender: TObject);
    procedure _dsItemPedidoStateChange(Sender: TObject);
    procedure _chkSomenteItemAtivosClick(Sender: TObject);
    procedure _rgFiltroItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
   idPrecoAtual:String;

    procedure AbrePedidosComprador(nrComprador,
                                   nrfornecedor:integer;
                                   idsituacao:string;
                                   dtinicio,
                                   dtfinal:tdatetime;
                                   PnrPedido,
                                   PcdOPeracaoRede,
                                   PcdProduto:Integer);




    procedure SetGridPedidos;
    procedure AbreItensPedidos(nrPedido: Integer);
    procedure SetGridItemPedido;
    procedure GerarExcelRelatarioCapaPedido(Consulta: TclientdataSet);
    procedure GerarExcelPedido;
//    function getCondicaoPagamento(nrcondicao: Integer): Boolean;
    function setCondicaoPagamento(nrParcela, nrDias: Integer; pcParcela,
      vlParcela: Double; dtPagamento: TDATE): Boolean;
    procedure AJustaParcelas;
    function AlteraItem(PnrPedido, PnrProduto,PnrDigitoProduto,PnrQuantidadePedido,
                        PnrVerba,PcdEmpresa: Integer; PvlItem,PpcDescontopadrao,
                        PpcDescontoAdicional, PpcVerba: Double;PidBonificado:Boolean): Boolean;
    procedure PesquisaPedido;
//    function GetPrecoItem(nrProduto, cdEmpresa: Integer; vlPrecoFornecedor,
  //    pcDescontoAbatimento: double; IdPrecoAtual: Char): TListaPreco;
    function GetPrecoItem(PnrProduto, PcdEmpresa: Integer;
      PvlPrecoFornecedor, PpcDescontoAbatimento: Double; PIdPrecoAtual: Char;
      PidPedidoBloqueado, PnrLIstaPrecoAtiva: Integer): TListaPreco;


    procedure setDesabilitaEdicaoItem;
    procedure CarregaEmpresa;
    function getCondicaoPagamento(Pnrcondicao: Integer): Boolean;
    function GerarExcelPedidoCSV:String;
    procedure AltualizaPrecoPedido(PnrPedido: Integer);
    function SetListaPrecoAtiva(PnrLista, PnrProduto,
      PnrEmpresa: Integer): TListaPrecoAtiva;
//    procedure Imprimir(nrPedido: Integer);
    { Private declarations }
  public
    { Public declarations }
    NR_TOTAL_ITENS,
    NR_TOTAL_UNIDADES,
    NR_UNIDADES_FAT,
    QT_UNIDADES_FAT   :Integer;

    VL_PEDIDO_CUSTO,
    VL_PEDIDO_FORNECEDOR,
    VL_FATURADO_CUSTO,
    VL_FATURADO_FORNEC :Double;
    stCondicao:String;
    DadosPedido :TDadosValoresPedido;
    idNavegando,idItemBonifiacado:Boolean;



  end;
 var
  _frmRelacaoPedidos: T_frmRelacaoPedidos;

implementation

uses uDm, uTelaPrazoPedido, uAtualizacaoPrecoPedido, uListaVerba,
  uTelaComprasNovaII;

{$R *.dfm}


procedure T_frmRelacaoPedidos.AbrePedidosComprador(nrComprador,
                                                   nrFornecedor:Integer;
                                                   idSituacao:String;
                                                   dtInicio,
                                                   dtFinal:TDateTime;
                                                   PnrPedido,
                                                   PcdOPeracaoRede,
                                                   PcdProduto:Integer);
var
 stQuery :TStringList;
 nrCd,nrProduto :Integer;

begin
 try
  nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);
  nrProduto:= StrToIntDef(copy(formatfloat('00000000',PcdProduto),1,7),0);
   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT NROP_P,');
     add('ID_UNIDADE_FEDERACAO AS LOCAL_CD,');
     add('CASE');
       add('WHEN CD_EMPRESA_DESTINO<>CD_EMPRESA THEN ''O.C.D''');
     add('ELSE ''Normal''');
     add('END ID_OCD,');
     add('LABP_P,NM_FORNECEDOR,DT_PEDIDO ,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,SITP_P,NM_USUARIO,OBSP_P,NR_CONDICAO_PAGTO_P,');
     add('SUM(NR_ITENS) AS NR_ITENS,SUM(NR_UNIDADES) AS NR_UNIDADES,');
     add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,ROUND(SUM(VL_PEDIDO_CUSTO),2) AS VL_PEDIDO_CUSTO,');
     add('SUM(VL_PED_LIQ) AS VL_PED_LIQ,');
     add('ROUND(SUM(VL_PEDIDO_FABR),2) AS VL_PEDIDO_FABR,SUM(NVL(NR_FATURADO,0)) AS NR_FATURADO,');
     add('SUM(NVL(QT_FATURADO,0)) AS QT_FATURADO,');
     add('SUM(VL_PED_FAT_LIQ) AS VL_PED_FAT_LIQ,');
     add('ROUND(SUM(VL_PED_FAT_CUSTO),2) AS VL_PEDIDO_FAT,');
     add('ROUND(SUM(VL_PED_FAT_FABR),2) AS VL_PED_FAT_FABR,');
     add('CD_EMPRESA,');
     add('sum(Nvl(NR_ITENS_BONIFICADO,0)) AS NR_ITENS_BONIFICADO,');
       add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_CROSSDOCKING,CD_EMPRESA_DESTINO,CD_EMPRESA');
     add('FROM');
     add('(SELECT');
     add('LABP_P,NROP_P,DATP_P AS DT_PEDIDO,PREP_P AS DT_PREVISTA,DT_PREVISTA_FATURAMENTO,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,ID_UNIDADE_FEDERACAO,');
     add('SITP_P,COUNT(*) NR_ITENS,SUM(QUAY_Y) as NR_UNIDADES,');
     add('SUM(QUAY_Y *VCCI_Y) as VL_PEDIDO_CUSTO,SUM(QUAY_Y *PFBY_Y) AS VL_PEDIDO_FABR,');
     add('SUM(CHEY_Y *VCCI_Y) as VL_PED_FAT_CUSTO,SUM(CHEY_Y * PFBY_Y) AS VL_PED_FAT_FABR,');
     add('SUM(QUAY_Y * PUNY_Y) AS VL_PED_LIQ,');
     add('SUM(CHEY_Y * PUNY_Y) AS VL_PED_FAT_LIQ,');

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
     add('NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,');
     add('CASE');
     add('WHEN QT_BONIFICADA>0 THEN COUNT(*)');
     add('END NR_ITENS_BONIFICADO,');
     add('CD_OPERADOR_LOGISTICO,FLAP_P,CAPA.ID_CROSSDOCKING,CD_EMPRESA_DESTINO,CAPA.NM_USUARIO');
     add(',OBSP_P');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM,');
     add('ACESSO.DC_EMPRESA CD');
     add('WHERE');
     ADD('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND  NROP_P = NROP_Y');
     add('AND ((CAPA.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
     add('AND CD.CD_EMPRESA=CAPA.cd_empresa_destino');
     add('AND ID_EMPRESA_FISICA=''S''');

     add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa_destino');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA = ITEM.NROM_Y');
     if _rgStatus.ItemIndex<4 then
     begin
//       add('AND (SITP_P not in(''T'') or (capa.cd_empresa=item.cd_empresa and capa.cd_empresa_destino=:PnrCd AND capa.id_crossdocking =''S''))');
       add('AND (SITP_P not in(''T'') or (capa.cd_empresa=item.cd_empresa and  capa.id_crossdocking =''S''))');
       add('AND  SITY_Y not in(''T'')');
     end;
     if _rgStatus.ItemIndex=4 then
     begin
//       add('AND (SITP_P  in(''T'') or (capa.cd_empresa=item.cd_empresa and capa.cd_empresa_destino=:PnrCd AND capa.id_crossdocking =''S''))');
       add('AND (SITP_P  in(''T'') or (capa.cd_empresa=item.cd_empresa  AND capa.id_crossdocking =''S''))');
       add('AND  SITY_Y  in(''T'')');
     end;
     if _rgStatus.ItemIndex=5 then
     begin
      add('AND sitp_p in(''W'')');
     end;
     if _rgStatus.ItemIndex=6 then
     begin
      add('AND sitp_p in(''W'',''N'',''P'') and  trim(CAPA.NM_MAQUINA)=''API''');
     end;

     if nrFornecedor>0 then
         add('AND LABP_P=:PnrFornecedor');
     if (_rgStatus.ItemIndex<>3) and (trim(idSituacao)<>'') then
         add('AND sitp_p=:PidStatus');
     if _rgStatus.ItemIndex=3 then
         add('AND sitp_p in(''N'',''P'',''F'')');
     if _rgFiltroItem.ItemIndex=1 then
         add('AND sity_y not in(''C'',''I'',''S'')');
       if _rgStatus.ItemIndex=6 then
          add('AND sity_y in(''W'',''N'',''P'')');

     if _chkPedidoOCD.Checked then
         add('AND CAPA.cd_empresa<>cd_empresa_destino');
      if PcdProduto>0 then
         add('AND nrom_Y=:PnrProduto');


     if nrComprador>0  then
        add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
     if PnrPedido=0 then
        add('AND trunc(DATP_P) between :PdtInicio and :PdtFinal');
     if PnrPedido>0 then
        add('AND NROP_P=:PnrPedido');

     // if PcdOperacaoRede=0 then
      // add('AND CAPA.CD_OPERACAO_REDE in(0,1)');

      if nrCd>0 then
       add('AND CAPA.cd_EMPRESA_DESTINO=:PnrCd');




     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITP_P,SITY_Y,NROP_P,OBSP_P,');
     add('DATP_P,PREP_P,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,');
     add('CAPA.CD_EMPRESA,VCCI_Y,CD_OPERADOR_LOGISTICO,FLAP_P,capa.id_crossdocking,ID_UNIDADE_FEDERACAO,CD_EMPRESA_DESTINO,QT_BONIFICADA,CAPA.NM_USUARIO)');
     add('GROUP BY LABP_P,NM_FORNECEDOR,NROP_P,SITP_P,DT_PEDIDO,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CD_EMPRESA,CD_OPERADOR_LOGISTICO,FLAP_P,');
     add('id_crossdocking,ID_UNIDADE_FEDERACAO,CD_EMPRESA_DESTINO,CD_EMPRESA,NM_USUARIO,OBSP_P');
     add('ORDER BY DT_PEDIDO,LABP_P,NROP_P');
     stQuery.SaveToFile('c:\temp\RelacaoPedido.sql');
   end;
   with _cdsPedido do
   begin
     close;
    // Params.Clear;
 //    if _rgStatus.ItemIndex<3 then
   //      Params.ParamByName('PidStatus').Destroy;
     CommandText:=stQuery.Text;
{     with _cdsPedido do
     begin
       _cdsPedido.AggregatesActive:=true;
       _cdsPedido.AggFields.Add. ('NR_TOTAL_ITENS');
       _cdsPedido.Aggregates.Add.Expression:='SUM(NR_ITENS)';
     end;}
     if PnrPedido=0 then
     begin
      Params.ParamByName('PdtInicio').AsDateTime:=dtInicio;
      Params.ParamByName('PdtFinal').AsDateTime :=dtFinal;
     end;
     if PnrPedido>0 then
        Params.ParamByName('PnrPedido').AsBCD:=PnrPedido;
     if nrComprador>0  then
       Params.ParamByName('PnrComprador').AsBCD:=nrComprador;
     if nrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').AsBCD:=nrFornecedor;
      if (_rgStatus.ItemIndex>0) and (_rgStatus.ItemIndex<3) then
       Params.ParamByName('PidStatus').AsString:=idSituacao;

       if PcdProduto>0 then
         Params.ParamByName('PnrProduto').AsBCD:=nrProduto;

      if nrCd>0 then
       Params.ParamByName('PnrCD').AsBCD:=nrCd;

     open;
   end;
   SetGridPedidos;
   SetGridItemPedido;
//   SetGridPedidoPendente;

//   if not _cdsLabPendencia.isEmpty then
  //    SetGridPendenciaLaboratorio

 finally
   FreeAndNil(stQuery);
 end;
end;


procedure T_frmRelacaoPedidos.SetGridPedidos;
begin
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayWidth:=7;

 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayWidth:=10;

 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayLabel:='Dt.Prevista';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayWidth:=10;

 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayLabel:='Vlr.Ped.Liquido';
 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayWidth:=12;


 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayLabel:='Vlr.Fatur.Liquido';
 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayWidth:=12;


 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayLabel:='Dt.Faturar em';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayWidth:=10;


 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayLabel:='Nr.Fornec.';
 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayWidth:=7;

 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayLabel:='Local.CD';
 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayWidth:=05;

 TStringField(_cdsPedido.FieldByName('ID_OCD')).DisplayLabel:='O.C.D';
 TStringField(_cdsPedido.FieldByName('ID_OCD')).DisplayWidth:=05;

 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOr')).DisplayWidth:=25;

 TStringField(_cdsPedido.FieldByName('NM_USUARIO')).DisplayLabel:='Usuario';
 TStringField(_cdsPedido.FieldByName('NM_USUARIO')).DisplayWidth:=15;
 TStringField(_cdsPedido.FieldByName('NM_USUARIO')).Visible:=FALSE;

 TStringField(_cdsPedido.FieldByName('OBSP_P')).DisplayLabel:='Observa??o';
 TStringField(_cdsPedido.FieldByName('OBSP_P')).DisplayWidth:=25;



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

 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayLabel:='Vlr.Pedido Custo';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayWidth:=12;

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

procedure T_frmRelacaoPedidos._btnParaExcelClick(Sender: TObject);
begin
  inherited;
// GerarExcel(_cdsPedido);
  _cdsPedido.ControlsDisabled;
  _cdsItemPedido.ControlsDisabled;
  GerarExcelRelatarioCapaPedido(_cdsPedido);

 _cdsPedido.EnableControls;
 _cdsItemPedido.EnableControls;

 _btnParaExcel.Enabled:=false;
end;

procedure T_frmRelacaoPedidos._dsItemPedidoStateChange(Sender: TObject);
begin
  inherited;
  if _cdsItemPedido.active then
     _cdsItemPedido.Edit;
end;

procedure T_frmRelacaoPedidos._dspedidoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if idNavegando then
  begin
    _grbAlerta.Visible:=false;
    idItemBonifiacado:=false;
    lABEL13.Caption:='';
   if _cdsPedido.FieldByName('NR_ITENS_BONIFICADO').AsInteger>0 then
   begin
      _grbAlerta.Visible:=True;
     lABEL13.Caption:='Bonificado';
      idItemBonifiacado:=true;
   end;
   if _cdsPedido.FieldByName('ID_CROSSDOCKING').AssTRING='S' then
   begin
      _grbAlerta.Visible:=True;

      lABEL13.Caption:='Pedido CrossDocking';
      if _cdsPedido.FieldByName('NR_ITENS_BONIFICADO').AsInteger>0  then
       lABEL13.Caption:='Bonificado -  Pedido CrossDocking';

      idItemBonifiacado:=true;
   end;

   AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
   _cdsItemPedido.Filtered:=false;
  _cdsCondicaoPagamentos.Close;
  getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);

   if _chkSomenteItemAtivos.Checked then
   begin
      with  _cdsItemPedido do
      begin
         Filter:='SITY_Y=''N''';
         Filtered:=true;
      end;
   end;

  end;

end;

procedure T_frmRelacaoPedidos._rgFiltroItemClick(Sender: TObject);
begin
  inherited;
   idNavegando:=false;
    PesquisaPedido;
    AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
    getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);

end;

procedure T_frmRelacaoPedidos._btnPesquisa1Click(Sender: TObject);
var
 dtInicio,dtFinal :String[10];
 idStatus :String[10];
begin
  //inherited;
  CorrigeoPERADORlOGISTICO;
  CorrigeSituacaoCrossdocking;
  idNavegando:=false;
  PesquisaPedido;



end;

procedure T_frmRelacaoPedidos._btnExcelPedidoClick(Sender: TObject);
begin
  inherited;
  AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
  getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);

   GerarExcelPedido;
end;

procedure T_frmRelacaoPedidos._btnImprimirClick(Sender: TObject);
var
 idPrecoCusto,idMostraDesconto:Char;

begin
  inherited;
  if not _cdsPedido.IsEmpty then
  begin
   _btnImprimir.Enabled:=false;
   idPrecoCusto:='N';
   if _chkRelatorioPrecoCusto.Checked then
      idPrecoCusto:='S';
   idMostraDesconto:='N';
   if _chkMostraDesconto.Checked then
      idMostraDesconto:='S';

   Imprimir(_cdsPedido.FieldByName('NROP_P').AsInteger,idPrecoCusto,idMostraDesconto);
   Mensagem('Relat?rio enviado para impressora',64);
   _btnImprimir.Enabled:=true;
  end;
end;

procedure T_frmRelacaoPedidos.DBGrid1DblClick(Sender: TObject);
var
 stnomeColuna:String;
 idMarcador:TBookmark;

begin
  inherited;

   DadosPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
   AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
   getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);




  stnomeColuna := DBGrid1.Columns.Grid.SelectedField.FieldName;

  if stnomeColuna='NROP_P' then
  begin
      if confirma('Deseja Abrir pedido com a tela de Pedido  ?',MB_DEFBUTTON2)=IDYES then
      begin
        nrFornecedorLocal :=_cdsPedido.FieldByName('LABP_P').AsInteger;
        NrPedidoApi     := _cdsPedido.FieldByName('NROP_P').AsInteger;
        idPedidoAgendado  :='N';

          idPedidoAPI:=true;
          nrPedidoAlteracao := _cdsPedido.FieldByName('NROP_P').AsInteger;


        Application.CreateForm(T_frmTelaCompras, _frmTelaCompras);
        _frmTelaCompras._lbeNrPedido.Text:=_cdsPedido.FieldByName('NROP_P').AsString;
         _frmTelaCompras.Repaint;

         _frmTelaCompras.Show;

          idPedidoAPI:=true;
         _frmTelaCompras.Repaint;

        FormPos(_frmTelaCompras,1,1);
      end;
  end;




  if stnomeColuna='SITP_P' then
  begin
     if _cdsPedido.FieldByName('SITP_P').AsString='W' then
     begin
         if confirma('Deseja Validar Pedido gerado pela API de "Pedido Automatico" ?',MB_DEFBUTTON2)=IDYES then
         begin
             if AtivaCapaPedidoAnalise(DadosPedido.nrPedido,'W','N',nmLogin) then
             begin
                _cdsPedido.edit;
                _cdsPedido.FieldByName('SITP_P').AsString:='N';
                _cdsPedido.post;

               if AtualizaStatusItemPedido(DadosPedido.nrPedido,0,DadosPedido.nrOperadorLogistico,'N') then
               begin
                    AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
                    getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
                    GerarExcelPedido;
                    Mensagem('Pedido Ativado !!!',MB_ICONINFORMATION);

               end;
             end;

         end
         else
             if confirma('Deseja Cancelar Pedido  gerado pela API de "Pedido Automatico" ?',MB_DEFBUTTON1)=IDYES then
                if AtivaCapaPedidoAnalise(_cdsPedido.FieldByName('NROP_P').AsInteger,'W','C',nmLogin ) then
                   if AtualizaStatusItemPedido(DadosPedido.nrPedido,0,DadosPedido.nrOperadorLogistico,'C') then
                       Mensagem('Pedido Cancelado !!!',MB_ICONWARNING);



       AbreItensPedidos(DadosPedido.nrPedido);
     end;
  end;

  if stnomeColuna='NR_CONDICAO_PAGTO_P' then
  begin
   Application.CreateForm(T_frmTelaPrazoPedido,_frmTelaPrazoPedido);
   FormPos(_frmTelaPrazoPedido,2,2);
   nrPrazoPedido:= _cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger;
   vlPedidoPrazo      :=_cdsPedido.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
   nrPedidoPrazo      :=_cdsPedido.FieldByName('NROP_P').AsInteger;
   dtPrevisaoEntregaPrazo   :=_cdsPedido.FieldByName('DT_PREVISTA').AsDateTime;
   nrFornecedorPrazo        :=_cdsPedido.FieldByName('LABP_P').AsInteger;
   dtFaturamentoPrazo       := _cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO').AsDateTime;
   NrCDPrazo                := _cdsPedido.FieldByName('CD_EMPRESA').AsInteger;

   idPedidoOCD:= false;
   if _cdsPedido.FieldByName('CD_EMPRESA').AsInteger<>_cdsPedido.FieldByName('CD_EMPRESA_DESTINO').AsInteger then
      idPedidoOCD:= true;
   idMarcador:=_cdsPedido.Bookmark;

   _frmTelaPrazoPedido.ShowModal;
    FreeAndNil(_frmTelaPrazoPedido);

    idNavegando:=false;
    PesquisaPedido;
   _cdsPedido.Bookmark:=idMarcador;





  end;




end;

procedure T_frmRelacaoPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with DBGrid1 do
  begin
    If odd(_dspedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;
  if( _cdsPedido.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger>1) then
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clAqua;
 end;
 if( _cdsPedido.FieldByName('NR_ITENS').AsInteger=_cdsPedido.FieldByName('NR_ITENS_BONIFICADO').AsInteger) then
 begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:= clBlue;
 end;

 if( _cdsPedido.FieldByName('SITP_P').AsString='W') then
 begin
    Canvas.Font.Color:= clAqua;
    Canvas.Brush.Color:= clBlack;

 end;

 if (Column.Field.FieldName = 'LOCAL_CD') then
 begin
  if _cdsPedido.FieldByName('LOCAL_CD').AsString='SC' then
  begin
    Canvas.brush.Color:= clGreen;
    Canvas.Font.Color:= clwhite;
  end;
  if _cdsPedido.FieldByName('LOCAL_CD').AsString='RS' then
  begin
    Canvas.brush.Color := $000080FF;
    Canvas.Font.Color := clBlack;
  end;
  if _cdsPedido.FieldByName('LOCAL_CD').AsString='ES' then
  begin
    Canvas.brush.Color := clFuchsia;
    Canvas.Font.Color := clBlack;
  end;


 end;
  if (Column.Field.FieldName ='NM_USUARIO') then
 begin
  if _cdsPedido.FieldByName('NM_USUARIO').AsString='API' then
  begin

   Canvas.brush.Color := clGreen;
   Canvas.Font.Color := clWhite;
  end;
 end;



 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clblue;
    Canvas.Font.Color:= clYellow;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmRelacaoPedidos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  idMarcador :TBookmark;
begin
  inherited;
  case key of
    //VK_RETURN :AtualizaEvento(_cdsPedido.FieldByName('NROp_p').AsInteger,15,_cdsPedido.FieldByName('SITP_P').AsString,
      //                        nmLogin,'Pedido Gerado... Status Gerado Apos Pedido');
    VK_F10 : begin
             key:=0;
             if Confirma('Deseja Cancelar Pedido?',MB_DEFBUTTON2)=IDYES then
             begin
              idMarcador:=_cdsPedido.Bookmark;
              DadosPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
              if TestaItemJaFaturado(DadosPedido.nrPedido,0,DadosPedido.cdEmpresa) then
              begin
                if  Confirma('Pedido J? possui Item faturado no Laboratorio...'+#13+
                             'Deseja Cancelar Realmente ?',MB_DEFBUTTON2)=IDno then
                          exit;
              end;
              AlteraStatusPedido(DadosPedido.nrPedido,0,true);
              if DadosPedido.nrPedidoVinculado>0 then
              begin
                if Confirma('Este pedido Tem um Pedido Vinculado a ele'+#13+
                            'Deseja Cancelar Este Pedido Tamb?m?',MB_DEFBUTTON2)=IDYES then
                 begin
                  AlteraStatusPedido(DadosPedido.nrPedidoVinculado,0,true);
                 end;

               end;
               _btnPesquisa.Click;
               if not _cdsPedido.IsEmpty then

                 _cdsPedido.Bookmark:=idMarcador;
             end;

    end;
  end;

end;

procedure T_frmRelacaoPedidos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   GeraOrdenacao(_cdsPedido,Column);
end;

procedure T_frmRelacaoPedidos._dbgItemPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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
 if (Column.Field.FieldName = 'QT_BONIFICADA') then
 begin
   if (_dsItemPedido.DataSet.FieldByName('QT_BONIFICADA').AsFloat>0) then
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

procedure T_frmRelacaoPedidos._dbgItemPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  idPosicao :TBookmark;
  nrMercadoria,nrDigitoMercadoria:Integer;
  vlLista,VlNota,vlDescontoCalculado,vlDescontoDigitado:Double;
  nomeColuna:String;
  nrVerba,NrVerbaTemp :Integer;

  _cdstemp:TclientDataset;


begin
  inherited;
  case key of
      VK_RETURN: begin


                        nomeColuna:= _dbgItemPedido.Columns.Grid.SelectedField.FieldName;
                        NrVerbaTemp:=_dsItemPedido.DataSet.FieldByName('NRVV_Y').AsInteger;
                       if  _cdsItemPedido.FieldByName(nomeColuna).ReadOnly then
                         exit;

                   _cdsItemPedido.edit;
                  _cdsItemPedido.post;



                 if (_cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger>0) and (_dsItemPedido.DataSet.FieldByName('NRVV_Y').AsInteger=0) then
                 begin
                             Mensagem('Este pedido Eh bonificado... '+#13+
                             'N?o pode zerar a verba', 16);

                            _cdsItemPedido.edit;
                            _dsItemPedido.DataSet.FieldByName('NRVV_Y').AsInteger:=NrVerbaTemp;
                            _cdsItemPedido.post;
                             exit;
                  end;





                  vlDescontoDigitado:=_dsItemPedido.DataSet.FieldByName('DADY_Y').AsFloat;
                  {if _cdsPedido.FieldByName('FLAP_P').AsInteger=1 then
                  begin
                    Mensagem('Este pedido Est? Bloqueado Para Altera??o... '+#13+
                             'Motivo mudan?a de Regra de Pre?o', 16);
                    exit;
                  end;}

                  if  _cdsItemPedido.FieldByName('nr_operador_logistico').AsInteger>1 then
                      if _cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0 then
                      begin
                           Mensagem('Pedido Opera??o Logistica n?o pode direcionar para verba!!!',16);
                           exit;
                      end;




                  if (nomeColuna='DADY_Y') or (nomeColuna='NRVV_Y') then
                  begin

                      if (_cdsItemPedido.FieldByName('DADY_Y').AsFloat=0) AND (_cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0)
                      and (_cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger=0) then
                     begin
                       _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:=0;
                      _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=0;
                    end;


                    if (_cdsItemPedido.FieldByName('NRVV_Y').AsInteger= 0) and (vlDescontoDigitado>0) and (_cdsItemPedido.FieldByName('nr_operador_logistico').AsInteger<=1)  then
                    begin

                      if Confirma('Colocar Desconto Adicional Para verba?',MB_DEFBUTTON2)=idYes then
                      begin
                        _cdstemp:=ListaVerbaFornecedor(  _cdsPedido.FieldByName('LABP_P').AsInteger);
                        if _cdstemp<>nil then
                        begin
                           _cdstemp.Open;
                           if _cdstemp.RecordCount>1 then
                           begin
                                 Application.CreateForm(T_frmListaVerbaFornecedor,_frmListaVerbaFornecedor);
                                   FormPos(_frmListaVerbaFornecedor,2,2);
                                   _frmListaVerbaFornecedor._cdsVerbaDisponiveis:=_cdstemp;
                                   _frmListaVerbaFornecedor._dsVerbaDisponiveis.DataSet:=_frmListaVerbaFornecedor._cdsVerbaDisponiveis;
                                   _frmListaVerbaFornecedor._cdsVerbaDisponiveis.Open;
                                   _frmListaVerbaFornecedor.ShowModal;
                                   nrVerba:=nrListaVerbaFornecedor;
                           end
                           else
                             nrVerba:=_cdstemp.FieldByName('nrov_v').AsInteger;

                            if nrVerba>0 then
                                  begin
                                       _cdsItemPedido.edit;
                                      _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:= nrverba;
                                      _cdsItemPedido.FieldByName('DADY_Y').AsFloat:=vlDescontoDigitado;
                                      _dsItemPedido.DataSet.FieldByName('DADY_Y').AsFloat:=vlDescontoDigitado;
                                       if (_cdsItemPedido.FieldByName('PC_VERBA').AsFloat=0) AND
                                          (_cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0) then
                                           _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=100;
                                   end;



                        end;


                      end
                      else
                      begin
                        if (_cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger=0) then
                        begin
                         _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:= 0;
                         nrVerba:=0;
                         NrVerbaTemp:=0;
                         _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=0;
                          _cdsItemPedido.FieldByName('VL_VERBA').ReadOnly:=false;
                         _cdsItemPedido.FieldByName('VL_VERBA').asfloat:=0;
                          _cdsItemPedido.FieldByName('VL_VERBA').ReadOnly:=true;
                        end;
                      end;


                    end;

                  end;


                  idPosicao:=_cdsItemPedido.Bookmark;
                  if _cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0 then
                  begin
                   if  GetNumeroVerba(_cdsItemPedido.FieldByName('NRVV_Y').AsInteger,
                                         _cdsPedido.FieldByName('LABP_P').AsInteger)=0 then
                   begin
                      Mensagem('Verba N?o Cadastrada para este Fornecedor !!!!',64);
                     _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:=0;
                     exit;
                   end;
                  end;
                  if (_cdsItemPedido.FieldByName('SITY_Y').AsString='N') or (_cdsItemPedido.FieldByName('SITY_Y').AsString='W') then
                  begin

                    idPosicao:=_cdsItemPedido.Bookmark;
                      vlLista:=_cdsItemPedido.FieldByName('PFBY_Y').asfloat;
                      VlNota := _dsItemPedido.DataSet.FieldByName('PUNY_Y').AsFloat;
                     vlDescontoCalculado:= CalculaDescontoAdicional(vlLista,
                                                                    vlNota,
                                                                    0,
                                                                    _cdsItemPedido.FieldByName('ABTY_Y').asfloat);

                  if vlDescontoCalculado>0 then
                    _cdsItemPedido.FieldByName('DADY_Y').asfloat:=vlDescontoCalculado;

                   if (_cdsItemPedido.FieldByName('PC_VERBA').AsFloat>0) AND
                      (_cdsItemPedido.FieldByName('DADY_Y').AsFloat>0) then
                    begin
                     if _cdsItemPedido.FieldByName('NRVV_Y').AsInteger=0 then
                        nrVerba:=GetNumeroVerba(0,_cdsPedido.FieldByName('LABP_P').AsInteger)
                     else
                       nrVerba:=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger ;

                       _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:=nrVerba;
                      _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=100;
                    end;

                    //
                   if (_cdsItemPedido.FieldByName('PC_VERBA').AsFloat=0) AND
                      (_cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0) then
                        _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=100;



                   if (_cdsItemPedido.FieldByName('DADY_Y').AsFloat=0) AND (_cdsItemPedido.FieldByName('VCCI_Y').AsFloat>0)
                      and (_cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger=0) then
                   begin
                       _cdsItemPedido.FieldByName('NRVV_Y').AsInteger:=0;
                       _cdsItemPedido.FieldByName('PC_VERBA').asfloat:=0;
                       //Zerando o valor da Verba
                       _cdsItemPedido.FieldByName('VL_VERBA').ReadOnly:=false;
                       _cdsItemPedido.FieldByName('VL_VERBA').asfloat:=0;
                       _cdsItemPedido.FieldByName('VL_VERBA').ReadOnly:=true;
                   end;


                   nrMercadoria      :=StrToIntDef(COPY(formatfloat('0000000',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger),1,6),0);
                   nrDigitoMercadoria:=StrToIntDef(COPY(formatfloat('0000000',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger),7,1),0);
                   idItemBonifiacado:=false;
                    if _cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger>0 then
                      idItemBonifiacado:=true;
                   AlteraItem(_cdsPedido.FieldByName('NROP_P').AsInteger,
                               nrMercadoria,
                               nrDigitoMercadoria,
                              _cdsItemPedido.FieldByName('QUAY_Y').AsInteger,
                              _cdsItemPedido.FieldByName('NRVV_Y').AsInteger,
                              _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,
                              VlNota,_cdsItemPedido.FieldByName('ABTY_Y').asfloat,
                              vlDescontoDigitado,
                             _cdsItemPedido.FieldByName('PC_VERBA').asfloat,idItemBonifiacado);
                  end
                  else
                  begin
                    Mensagem('Item N?o pode ser modificado',48);
                    _cdsItemPedido.CancelUpdates;
                  end;
                  AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
                  if _cdsItemPedido.Locate('NROM_Y',nrMercadoria,[]) then
                     sleep(0);


                 end;

      VK_F5 : begin
                 with _dbgItemPedido do
                 begin
                    idPosicao:=_cdsItemPedido.Bookmark;
                    if _cdsItemPedido.FieldByName('SITY_Y').AsString='C' then
                    begin
                      if Confirma('Item esta Inativo...'+#13+
                                  'Deseja Reativar o Item?',MB_DEFBUTTON2)=idYes then
                      begin
                           if  AtivarItemPedido(_cdsPedido.FieldByName('NROP_P').AsInteger ,
                                                _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                                                _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,
                                                'N',
                                                 nmLogin) then
                                               Mensagem('Item Pedido Ativado!!!',MB_ICONWARNING)



                           end
                           else
                             Mensagem('N?o Alterou o Status do Item!!!',MB_ICONWARNING);




                   end
                   else
                   begin
                     if _cdsItemPedido.FieldByName('ID_NFE_TRANSITO').AsString='S' then
                     begin

                      if not GetsituacaoNfe(_cdsPedido.FieldByName('NROP_P').AsInteger,
                                        _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                                         _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger)then
                      begin
                      if GetStatusNfe(_cdsPedido.FieldByName('NROP_P').AsInteger,
                                      _cdsItemPedido.FieldByName('NROM_Y').AsInteger) then

                      begin
                              Mensagem('Este Item J? Foi Faturado No Fornecedor!!!'+#13+
                                       'N?o pode ser excluida!!!',MB_ICONWARNING);
                        exit;
                      end;
                      end;
                     end;


                     AlteraStatusItemPedido(_cdsPedido.FieldByName('NROP_P').AsInteger ,
                                           _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                                           _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,nmLogin);

                    DaDosPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
                    if DadosPedido.nrItensPedido=0 then
                       AlteraStatusPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,0,false);
                   end;


                 AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
                if DadosPedido.nrItensPedido>0 then
                   _cdsItemPedido.Bookmark:=idPosicao;
                end;
              end;
  end;
end;

procedure T_frmRelacaoPedidos._dbgItemPedidoTitleClick(Column: TColumn);
begin
  inherited;
   GeraOrdenacao(_cdsItemPedido,Column);

end;

procedure T_frmRelacaoPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  _edtNumeroComprador.Text:=IntToStr(nrCompradorSistema);
  _dtpDtInicio.Date:=dtSistema-1;
  _dtpDtFinal.Date :=dtSistema;
end;


procedure T_frmRelacaoPedidos.FormShow(Sender: TObject);
begin
//  inherited;
 CarregaEmpresa;
end;

procedure T_frmRelacaoPedidos.AbreItensPedidos(nrPedido:Integer);
var
 stQuery :TStringList;
 cdProdutoLocal:Integer;
begin
 try
  cdProdutoLocal:=StrToIntDef(_edtCodigoProduto.Text,0);
  cdProdutoLocal:= StrToIntDef(copy(formatfloat('00000000',cdProdutoLocal),1,7),0);

   stQuery:=TStringList.Create;
   with stQuery do
   begin

    add('SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('NROP_Y, NROM_Y, QUAY_Y, CHEY_Y,SITY_Y, ABTY_Y,DADY_Y,PC_DESCONTO_NEGOCIADO,');
    add('PRZY_Y, PUNY_Y,  PFBY_Y,  DFIY_Y, VCCI_Y,');
    add('NRVV_Y  ,CD_INTERNO_LABORATORIO,PC_VERBA ,VL_VERBA , ID_DESCONTO_ACUMULATIVO,');
    add('CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_OPERADOR_LOGISTICO,CD_EMPRESA,QT_BONIFICADA,');
    add('NR_DIAS_ESTOQUE,QT_SUGERIDA,VL_MEDIA_VENDA,ID_NFE_TRANSITO,CD_EAN_COMPRA');
    add('FROM');
    add('PRDDM.DCPCI,');
    add('PRDDM.DC_MERCADORIA');
    add('WHERE NROM_Y=CD_MERCADORIA');
    if _rgFiltroItem.ItemIndex=0 then
         add('AND sity_y not in(''I'',''S'')');
    if _rgFiltroItem.ItemIndex=1 then
         add('AND sity_y not in(''C'',''I'',''S'')');
     if cdProdutoLocal>0 then
         add('AND nrom_y=:PnrProduto');


    add('AND NROP_Y = :PnrPedido');
   end;
   stQuery.SaveToFile('c:\temp\Compras_qryRelacaoPedidoItem.sql');
   with _cdsItemPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsBcd:=nrPedido;
     if cdProdutoLocal>0 then
       Params.ParamByName('PnrProduto').Asbcd:=cdProdutoLocal;
     open;
     SetGridItemPedido;
     setDesabilitaEdicaoItem;
   end;
 finally
   FreeAndNil(stQuery);
 end;
end;

procedure T_frmRelacaoPedidos.SetGridItemPedido;
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



Procedure GerarPedidoTabelaArquivoCVS(PTabela:TDataSet;PstTituloRelatorio,PnmArquivo:String);
var
 i: Integer; // Coluna
 j: Integer; // Linha

 arq: TextFile;
 nrlinHa:integer;
 stLinha,stLinhaTemp:WideString;
 stLista: TStringList;
 vlResultado: Variant;


 function retirarQuebraLinha(aTxt : string):string;
 begin
   atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
   Result:=aTxt;
 end;

begin
  PTabela.Open;
  PTabela.First;

begin
  try
    stLista:=TStringList.Create;
    stLista.Clear;

    PnmArquivo:=PnmArquivo;
    AssignFile(arq,PnmArquivo );
    Rewrite(arq, PnmArquivo);

    stLinha:='Genesio A. Mendes & Cia. Ltda';
    Writeln(arq,stLinha);
    stLinha:=PstTituloRelatorio;
    Writeln(arq,stLinha);
    stLinha:='Data Emiss?o do Rel.:'+FormatDateTime('dd/mm/yyyy',dtSistema);
    Writeln(arq,stLinha);

   J:=0;
   stLinha:=EmptyStr;


   stLinha:=PTabela.Fields[00].DisplayLabel+','+
                  Ptabela.Fields[01].DisplayLabel+';'+
                  Ptabela.Fields[02].DisplayLabel+';'+
                  Ptabela.Fields[03].DisplayLabel+';'+
                  Ptabela.Fields[04].DisplayLabel+';'+
                  Ptabela.Fields[05].DisplayLabel+';'+
                  Ptabela.Fields[06].DisplayLabel+';'+
                  Ptabela.Fields[07].DisplayLabel+';'+
                  Ptabela.Fields[08].DisplayLabel+';'+
                  Ptabela.Fields[09].DisplayLabel+';'+
                  Ptabela.Fields[10].DisplayLabel+';'+
                  Ptabela.Fields[11].DisplayLabel+';'+
                  Ptabela.Fields[12].DisplayLabel+';'+
                  Ptabela.Fields[13].DisplayLabel+';'+
                  Ptabela.Fields[14].DisplayLabel+';'+
                  Ptabela.Fields[15].DisplayLabel+';'+
                  Ptabela.Fields[16].DisplayLabel+';'+
                  Ptabela.Fields[17].DisplayLabel+';';

  { while J<= PTabela.FieldCount - 1 do
   begin

      if PTabela.Fields[j].Visible then
      begin
        if stLinha<>'' then
          stLinha:= stLinha +';'+ PTabela.Fields[j].DisplayName
        else
          stLinha:= PTabela.Fields[j].DisplayName;

      end;
     inc(j);
   end;}
   Writeln(arq,stLinha);
   PTabela.First;
   PTabela.DisableControls;
   while not PTabela.Eof do
   begin
       J:=0;
       stLinha:=EmptyStr;
     {while J<= PTabela.FieldCount - 1 do
     begin

      if PTabela.Fields[j].Visible then
      begin

        vlResultado := SetTipoCampoII(PTabela.Fields[J].DataType);

        if stLinha<>'' then
          stLinha:= stLinha+';'+PreencheStringTabela(vlResultado, J, i, j, PTabela)
        else
          stLinha:= PreencheStringTabela(vlResultado, J, i, j, PTabela);

      end;




     inc(j);
   end;   }
   Writeln(arq,stLinha);

      PTabela.Next;
    end;
    CloseFile(arq);
   PTabela.EnableControls;

  // ShellExecute(Handle, 'Open',PnmArquivo , nil, 'C:\TEMP\', SW_SHOWNORMAL);
  finally
    stLista.Free;
  end;


end;
end;



Procedure T_frmRelacaoPedidos.GerarExcelRelatarioCapaPedido(Consulta:TclientdataSet);
var
     coluna, linha,nrLinaInicial: integer;
     excel: variant;
     valor: String ;
     data  :String;
     tipo : TFieldType;
     vlDefault :Variant;

begin
try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
     except
          Application.MessageBox ('Vers?o do Ms-Excel'+
          'Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
     nrLinaInicial:=4;
     Consulta.First;
     try

        Consulta.DisableControls;

        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        excel.cells[02,01]:='Relatorio Pedido(s)';

        excel.cells[03,01]:=Consulta.Fields[00].DisplayLabel;
        excel.cells[03,02]:=Consulta.Fields[01].DisplayLabel;
        excel.cells[03,03]:=Consulta.Fields[02].DisplayLabel;
        excel.cells[03,04]:=Consulta.Fields[03].DisplayLabel;
        excel.cells[03,05]:=Consulta.Fields[04].DisplayLabel;
        excel.cells[03,06]:=Consulta.Fields[05].DisplayLabel;
        excel.cells[03,07]:=Consulta.Fields[06].DisplayLabel;
        excel.cells[03,08]:=Consulta.Fields[07].DisplayLabel;
        excel.cells[03,09]:=Consulta.Fields[08].DisplayLabel;
        excel.cells[03,10]:=Consulta.Fields[09].DisplayLabel;
        excel.cells[03,11]:=Consulta.Fields[10].DisplayLabel;
        excel.cells[03,12]:=Consulta.Fields[11].DisplayLabel;
        excel.cells[03,13]:=Consulta.Fields[12].DisplayLabel;
        excel.cells[03,14]:=Consulta.Fields[13].DisplayLabel;
        excel.cells[03,15]:=Consulta.Fields[14].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[15].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[16].DisplayLabel;
        excel.cells[03,17]:=Consulta.Fields[17].DisplayLabel;
        linha:=3;
        coluna:=1;
        Consulta.First;
         while not Consulta.Eof do
         begin
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=Consulta.FieldByName('NROP_P').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=Consulta.FieldByName('LOCAL_CD').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=Consulta.FieldByName('LABP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=Consulta.FieldByName('NM_FORNECEDOR').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=Consulta.FieldByName('DT_PEDIDO').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=Consulta.FieldByName('DT_PREVISTA').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=Consulta.FieldByName('SITP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=Consulta.FieldByName('NR_ITENS').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=Consulta.FieldByName('NR_UNIDADES').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,10]:=Consulta.FieldByName('NR_CANCELADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,11]:=Consulta.FieldByName('NR_NOVO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=Consulta.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=Consulta.FieldByName('VL_PEDIDO_FABR').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=Consulta.FieldByName('NR_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=Consulta.FieldByName('QT_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=Consulta.FieldByName('VL_PEDIDO_FAT').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=Consulta.FieldByName('VL_PED_FAT_FABR').AsFloat;
           inc(linha);
           Inc(coluna);
           Consulta.Next;
         end;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=NR_TOTAL_ITENS;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=NR_TOTAL_UNIDADES;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=VL_PEDIDO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=VL_PEDIDO_FORNECEDOR;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=NR_UNIDADES_FAT;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=QT_UNIDADES_FAT;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=VL_FATURADO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=VL_FATURADO_FORNEC;

       // end;                                                          _cdsPedido.AsVariant
        excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
       on E:Exception do
      begin
          Application.MessageBox(pchar(format('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel.Detalhes: %s',[E.Message])),'Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     Consulta.EnableControls;

     //excel.quit;
end;


{Procedure T_frmRelacaoPedidos.GerarExcelRelatarioCapaPedidocsv(Consulta:TclientdataSet);
var
     coluna, linha,nrLinaInicial: integer;
     valor: String ;
     data  :String;
     tipo : TFieldType;
     vlDefault :Variant;
     stLinha:WideString;


begin
     nrLinaInicial:=4;
     Consulta.First;
     try

        Consulta.DisableControls;

{        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        excel.cells[02,01]:='Relatorio Pedido(s)';

        excel.cells[03,01]:=Consulta.Fields[00].DisplayLabel;
        excel.cells[03,02]:=Consulta.Fields[01].DisplayLabel;
        excel.cells[03,03]:=Consulta.Fields[02].DisplayLabel;
        excel.cells[03,04]:=Consulta.Fields[03].DisplayLabel;
        excel.cells[03,05]:=Consulta.Fields[04].DisplayLabel;
        excel.cells[03,06]:=Consulta.Fields[05].DisplayLabel;
        excel.cells[03,07]:=Consulta.Fields[06].DisplayLabel;
        excel.cells[03,08]:=Consulta.Fields[07].DisplayLabel;
        excel.cells[03,09]:=Consulta.Fields[08].DisplayLabel;
        excel.cells[03,10]:=Consulta.Fields[09].DisplayLabel;
        excel.cells[03,11]:=Consulta.Fields[10].DisplayLabel;
        excel.cells[03,12]:=Consulta.Fields[11].DisplayLabel;
        excel.cells[03,13]:=Consulta.Fields[12].DisplayLabel;
        excel.cells[03,14]:=Consulta.Fields[13].DisplayLabel;
        excel.cells[03,15]:=Consulta.Fields[14].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[15].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[16].DisplayLabel;
        excel.cells[03,17]:=Consulta.Fields[17].DisplayLabel;
        linha:=3;
        coluna:=1;
        Consulta.First;
         while not Consulta.Eof do
         begin
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=Consulta.FieldByName('NROP_P').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=Consulta.FieldByName('LOCAL_CD').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=Consulta.FieldByName('LABP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=Consulta.FieldByName('NM_FORNECEDOR').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=Consulta.FieldByName('DT_PEDIDO').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=Consulta.FieldByName('DT_PREVISTA').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=Consulta.FieldByName('SITP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=Consulta.FieldByName('NR_ITENS').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=Consulta.FieldByName('NR_UNIDADES').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,10]:=Consulta.FieldByName('NR_CANCELADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,11]:=Consulta.FieldByName('NR_NOVO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=Consulta.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=Consulta.FieldByName('VL_PEDIDO_FABR').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=Consulta.FieldByName('NR_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=Consulta.FieldByName('QT_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=Consulta.FieldByName('VL_PEDIDO_FAT').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=Consulta.FieldByName('VL_PED_FAT_FABR').AsFloat;
           inc(linha);
           Inc(coluna);
           Consulta.Next;
         end;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=NR_TOTAL_ITENS;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=NR_TOTAL_UNIDADES;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=VL_PEDIDO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=VL_PEDIDO_FORNECEDOR;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=NR_UNIDADES_FAT;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=QT_UNIDADES_FAT;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=VL_FATURADO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=VL_FATURADO_FORNEC;

       // end;                                                          _cdsPedido.AsVariant
        excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
       on E:Exception do
      begin
          Application.MessageBox(pchar(format('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel.Detalhes: %s',[E.Message])),'Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     Consulta.EnableControls;

     //excel.quit;
end;}


Procedure T_frmRelacaoPedidos.GerarExcelPedido;
var
     coluna, linha,nrLinaInicial: integer;
     excel: variant;
     valor: String ;
     data,dsCondicaoPagamento,
     nmFornecedor  :String;
     tipo : TFieldType;
     vlDefault :Variant;
     DadosCd :TDadosCD;
     DadosValoresPedido:TDadosValoresPedido;
     stObs:String;
     vlItemPedido,pcDescontoItem:Double;
     dsNmPlanilha,sVersaoExcel,stExtrensao:String;
     idPedidoPsico:Boolean;
     DadosFornecedor:TDadosFornecedor;
     VersaoExcel,nmArquivo :string;



begin
     try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
         VersaoExcel:=excel.version;

     except
         // Application.MessageBox ('Vers?o do Ms-Excel Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
          VersaoExcel:=EmptyStr;

     end;

     if VersaoExcel=EmptyStr then
     begin
      nmArquivo:=  GerarExcelPedidoCSV;
      if _cdsPedido<>nil then
      begin
        ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
        Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION);
        exit;

     end;
     end;




     nrLinaInicial:=4;

     //Se a vers?o do excel form 2007 ou superior salva em XLSX
      sVersaoExcel := Format('Excel Version %s: ', [EXCEL.Version]);
      stExtrensao:='.xls';
      if sVersaoExcel >= 'Excel Version 12.0' then
        stExtrensao := '.xls' ;
  //Se a vers?o do excel for inferior ao 2007 ent?o salva no formato XLS

     DadosValoresPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,true);
     DadosCd:=GetDadosCD(DadosValoresPedido.cdEmpresa);
     getCondicaoPagamento(DadosValoresPedido.nrCondicaoPagamento);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

     excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
     excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger)];


      if not DirectoryExists(dsLocalPanilha) then
       ForceDirectories(dsLocalPanilha);

     //_cdsPedido.First;
     try
        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        //Formatando c?lulas escritas
         excel.range['A1','A1'].Font.Bold      := true;
        excel.cells[02,01]:='Pedido de Compra :'+_cdsPedido.FieldByName('NROP_P').AsString;
        excel.cells[03,01]:='Data Pedido      :'+FormatDateTime('DD/MM/YYYY',_cdsPedido.FieldByName('DT_PEDIDO').AsDateTime);
        excel.cells[04,01]:='Cond. Pagamento  :'+ stCondicao;


        excel.cells[06,01]:='Observa??es';
        //Formatando c?lulas escritas
         excel.range['A6','A6'].Font.Bold      := true;
        excel.cells[07,01]:=' Informar Nr. do Nosso Pedido '+_cdsPedido.FieldByName('NROP_P').AsString+' na Nota Fiscal/Danfe em Dados Adicionais';
        excel.cells[08,01]:=' E no XML informar no campo correspondente (Tag compra x Ped)';

//        dsNmPlanilha:='Pedido_'+trim(,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_'+DadosCd.stEstado +stExtrensao;
        nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
        dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';

     //    excel.Name:=dsNmPlanilha;

        stObs:=DadosValoresPedido.stObservacaoPedido;
        idPedidoPsico:=false;
        if AnsiContainsStr(stObs,'Psicotr?picos') then
        begin
           idPedidoPsico:=true;
           dsNmPlanilha:='Pedido_'+trim(StringReplace(_cdsPedido.FieldByName('NM_FORNECEDOR').asstring,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_Psicotropicos'+'_'+DadosCd.stEstado+stExtrensao
        end;
        if (DadosValoresPedido.nrPedidoVinculado>0)  then
           stObs:= stObs + ' Existe outro Pedido Vinculado a Este --> '+FormatFloat('000000',DadosValoresPedido.nrPedidoVinculado);
       if trim(stObs)<>''  then
       begin
           excel.cells[10,01]:='Importante.:'+trim(stObs);
                   //Formatando c?lulas escritas
         excel.range['A10','A10'].Font.Bold      := true;

       end;

            (* ==== Formata??o Cor da linha contorno ==== *)
{
         ColorIndex := 1 - Preto
         ColorIndex := 2 - Branco
         ColorIndex := 3 - Vermelho
         ColorIndex := 4 - Verde Claro
         ColorIndex := 5 - Azul
         ColorIndex := 6 - Amarelo
         ...
         ColorIndex := 56 - Cinza Escuro
}


        excel.cells[12,01]:='CNPJ para Faturamento : '+ DadosCd.nrCNPJ;
        excel.cells[13,01]:='Endere?o de Entrega ';
                //Formatando c?lulas escritas
         excel.range['A13','A13'].Font.Bold      := true;
         excel.range['A13','A13'].Font.ColorIndex := 1;//Cor da linha: Preto


        excel.cells[14,01]:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        excel.cells[15,01]:='Bairro.: '+DadosCd.stBAIRRO;
        excel.cells[16,01]:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        excel.range['A16','A16'].Font.Bold      := true;
        excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: Preto

        excel.cells[17,01]:='CEP.:'+DadosCd.stCEP;

        excel.cells[18,01]:='Cod. GAM';
        excel.cells[18,02]:='Cod.Fornec.';
        excel.cells[18,03]:='Cod.EAN';

        excel.cells[18,04]:='Qtdade';
        excel.cells[18,05]:='Nome e Apresenta??o';
        excel.cells[18,06]:='P?o. Unit.';
        excel.cells[18,07]:='% Desconto';
        excel.cells[18,08]:='Total Unit.';
        linha:=18;
        coluna:=1;
        excel.range['A18','G18'].Font.Bold      := true;
        _cdsItemPedido.First;
         while not _cdsItemPedido.Eof do
         begin

          // if  then

           if _chkRelatorioPrecoCusto.Checked then
               vlItemPedido:=_cdsItemPedido.FieldByName('PUNY_Y').AsFloat
           else
               vlItemPedido:=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;

           if _chkMostraDesconto.Checked then
               pcDescontoItem:=_cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                               _cdsItemPedido.FieldByName('DADY_Y').AsFloat
           else
             pcDescontoItem:=0;

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=_cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03].NumberFormat:='#############0_);(#############0)';
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04].NumberFormat:='#.##0_);( #.##0,00)';
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=_cdsItemPedido.FieldByName('NM_MERCADORIA').AsString+' '+
                                                           _cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString ;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=vlItemPedido;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06].NumberFormat:='#.##0,00_);( #.##0,00)';


           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=pcDescontoItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07].NumberFormat:='#.##0,00_);( #.##0,00 %)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=vlItemPedido*
                                                          _cdsItemPedido.FieldByName('QUAY_Y').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08].NumberFormat:='#.##0,00_);( #.##0,00 )';
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 2;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

           inc(linha);
           inc(coluna);
           _cdsItemPedido.Next;
         end;
       // end;                                                          _cdsPedido.AsVariant
             // Define o tamanho das Colunas (basta fazer em uma delas e as demais ser?o alteradas)
         excel.range['A19'].ColumnWidth := 10;  // Cod. GAM
         excel.range['B19'].ColumnWidth := 20;  //Cod.Fornec.';
         excel.range['C19'].ColumnWidth := 14; //Cod.EAN';
         excel.range['D19'].ColumnWidth := 10; // excel.cells[18,04]:='Qtdade';
         excel.range['E19'].ColumnWidth := 35; //Nome e Apresenta??o';
         excel.range['F19'].ColumnWidth := 14;// 'P?o. Unit.';
         excel.range['G19'].ColumnWidth := 14; //'% Desconto';
         excel.range['H19'].ColumnWidth := 14; //'Total Unit.';

         excel.range['A18','H18'].Borders.LineStyle := 1;
         excel.range['A18','H18'].Borders.Weight := 2;
         excel.range['A18','H18'].Borders.ColorIndex := 1;
         excel.Cells[linha+1,1].formula := 'Nr. de Unidades';
         excel.Cells[linha+1,5].formula := 'Total do Pedido (R$) ';
         //Mesclando C?lulas
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].MergeCells := true;

         {alinhamento horizontal no centro}
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].HorizontalAlignment := 3;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].HorizontalAlignment := 3;


         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.Cells[linha+1,4].formulaLocal := '=Soma(D19:D'+inttostr(linha)+')';
         excel.Cells[linha+1,8].formulalocal := '=Soma(H19:H'+inttostr(linha)+')';
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 3;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

         //Formatando c?lulas escritas

         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Font.Bold      := true;
        //  Se for salvar a aplica??o totalmente criada:
       if not FileExists(dsLocalPanilha+'\'+dsNmPlanilha) then
        excel.ActiveWorkBook.Saveas(dsLocalPanilha+'\'+dsNmPlanilha,56);
 //       if  saveExcel.es(dsNmPlanilha);

   //     excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     _cdsItemPedido.EnableControls;

     //excel.quit;
end;




function T_frmRelacaoPedidos.GerarExcelPedidoCSV:String;
var
     coluna, linha,nrLinaInicial,QtdItem: integer;
     excel: variant;
     valor: String ;
     data,dsCondicaoPagamento,
     nmFornecedor  :String;
     tipo : TFieldType;
     vlDefault :Variant;
     DadosCd :TDadosCD;
     DadosValoresPedido:TDadosValoresPedido;
     stObs:String;
     vlItemPedido,pcDescontoItem,TotalItem,TotalPedido:Double;
     dsNmPlanilha,sVersaoExcel,stExtrensao,
     nmArquivo:String;
     idPedidoPsico:Boolean;
     DadosFornecedor:TDadosFornecedor;

     i: Integer; // Coluna
     j: Integer; // Linha

     arq: TextFile;
     nrlinHa:integer;
     stLinha,stLinhaTemp:WideString;
     stLista: TStringList;
     vlResultado: Variant;


     function retirarQuebraLinha(aTxt : string):string;
     begin
       atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
       atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
       atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
       Result:=aTxt;
     end;





begin
     nrLinaInicial:=4;

     //Se a vers?o do excel form 2007 ou superior salva em XLSX
  //Se a vers?o do excel for inferior ao 2007 ent?o salva no formato XLS

     DadosValoresPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
     DadosCd:=GetDadosCD(DadosValoresPedido.cdEmpresa);
     getCondicaoPagamento(DadosValoresPedido.nrCondicaoPagamento);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

     //excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
    // excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger)];


      if not DirectoryExists(dsLocalPanilha) then
       ForceDirectories(dsLocalPanilha);

     //_cdsPedido.First;
     try

      nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
      dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.csv';

    nmArquivo:='C:\temp\'+dsNmPlanilha;
    AssignFile(arq,nmArquivo );
    Rewrite(arq, nmArquivo);
    result:=nmArquivo;

    stLinha:='Genesio A. Mendes & Cia. Ltda';
    Writeln(arq,stLinha);
    stLinha:='Pedido Compra :'+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
    Writeln(arq,stLinha);
    stLinha:='Data Pedido.:'+FormatDateTime('dd/mm/yyyy',_cdsPedido.FieldByName('DT_PEDIDO').AsDateTime);
    Writeln(arq,stLinha);
    stLinha:='Cond. Pagamento :'+stCondicao;
    Writeln(arq,stLinha);
    Writeln(arq,' ');
    stLinha:='Observa??es ';
    Writeln(arq,stLinha);
    stLinha:=' Informar Nr. do Nosso Pedido '+_cdsPedido.FieldByName('NROP_P').AsString+' na Nota Fiscal/Danfe em Dados Adicionais';
    Writeln(arq,stLinha);
    stLinha:=' E no XML informar no campo correspondente (Tag compra x Ped)';
    Writeln(arq,stLinha);
    Writeln(arq,' ');


    stObs:=DadosValoresPedido.stObservacaoPedido;
    idPedidoPsico:=false;
    if AnsiContainsStr(stObs,'Psicotr?picos') then
    begin
      idPedidoPsico:=true;
      dsNmPlanilha:='Pedido_'+trim(StringReplace(_cdsPedido.FieldByName('NM_FORNECEDOR').asstring,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_Psicotropicos'+'_'+DadosCd.stEstado+stExtrensao
    end;
    if (DadosValoresPedido.nrPedidoVinculado>0)  then
         stObs:= stObs + ' Existe outro Pedido Vinculado a Este --> '+FormatFloat('000000',DadosValoresPedido.nrPedidoVinculado);
    if trim(stObs)<>''  then
    begin
       stLinha:='Importante.:'+trim(stObs);
       Writeln(arq,stLinha);
       Writeln(arq,' ');
     end;
     if trim(stobs)='' then
     begin
        Writeln(arq,' ');
        Writeln(arq,' ');
        Writeln(arq,' ');
     end;




       stLinha:='CNPJ para Faturamento : '+ DadosCd.nrCNPJ;
       Writeln(arq,stLinha);

        stLinha:='Endere?o de Entrega ';
        Writeln(arq,stLinha);
                //Formatando c?lulas escritas
       //  excel.range['A13','A13'].Font.Bold      := true;
       //  excel.range['A13','A13'].Font.ColorIndex := 1;//Cor da linha: Preto

        stLinha:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        Writeln(arq,stLinha);

        stLinha:='Bairro.: '+DadosCd.stBAIRRO;
        Writeln(arq,stLinha);
        stLinha:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        Writeln(arq,stLinha);


//        excel.range['A16','A16'].Font.Bold      := true;
  //      excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: Preto

        stLinha:='CEP.:'+DadosCd.stCEP;
        Writeln(arq,stLinha);
        Writeln(arq,' ');

        stLinha:='Cod. GAM'+';'+
                 'Cod.Fornec.'+';'+
                 'Cod.EAN'+';'+
                 'Qtdade'+';'+
                 'Nome e Apresenta??o'+';'+
                 'P?o. Unit.'+';'+
                 '% Desconto'+';'+
                 'Total Unit.';
        Writeln(arq,stLinha);

        linha:=18;
        coluna:=1;
        TotalPedido:=0;
        QtdItem:=0;
        _cdsItemPedido.First;
         while not _cdsItemPedido.Eof do
         begin

          // if  then

           if _chkRelatorioPrecoCusto.Checked then
               vlItemPedido:=_cdsItemPedido.FieldByName('PUNY_Y').AsFloat
           else
               vlItemPedido:=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;

           if _chkMostraDesconto.Checked then
               pcDescontoItem:=_cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                               _cdsItemPedido.FieldByName('DADY_Y').AsFloat
           else
             pcDescontoItem:=0;
             QtdItem:=QtdItem+_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
             TotalItem:= vlItemPedido*_cdsItemPedido.FieldByName('QUAY_Y').AsFloat;

             stLinha:=FormatFloat('#######0',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger)+';'+
                                  _cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').AsString+';'+
                                  FormatFloat('#############0',_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsFloat)+';'+
                                  FormatFloat('#####0',_cdsItemPedido.FieldByName('QUAY_Y').AsInteger)+';'+
                                   _cdsItemPedido.FieldByName('NM_MERCADORIA').AsString+' '+_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString +';'+
                                  FormatFloat('#####0.00',vlItemPedido)+';'+
                                  FormatFloat('#####0.00%',pcDescontoItem)+';'+
                                  FormatFloat('#####0.00',TotalItem);

            TotalPedido:=TotalPedido + TotalItem;

            Writeln(arq,stLinha);

           inc(linha);
           inc(coluna);
           _cdsItemPedido.Next;
         end;

         stLinha:='Nr.Itens '+';'+
                  '  '+';'+
                  '  '+';'+
                 FormatFloat('#######0',QtdItem)+';'+
                  '  '+';'+
                 'Total do Pedido(R$)  '+';'+
                  '  '+';'+
                 FormatFloat('#######0.00',TotalPedido)+';'+
                  '  '+';'+
                  '  '+';'+
                  '  ';
         Writeln(arq,stLinha);


       // end;                                                          _cdsPedido.AsVariant
             // Define o tamanho das Colunas (basta fazer em uma delas e as demais ser?o alteradas)
//         excel.range['A19'].ColumnWidth := 10;  // Cod. GAM
//         excel.range['B19'].ColumnWidth := 20;  //Cod.Fornec.';
//         excel.range['C19'].ColumnWidth := 14; //Cod.EAN';
//         excel.range['D19'].ColumnWidth := 10; // excel.cells[18,04]:='Qtdade';
//         excel.range['E19'].ColumnWidth := 35; //Nome e Apresenta??o';
//         excel.range['F19'].ColumnWidth := 14;// 'P?o. Unit.';
 //        excel.range['G19'].ColumnWidth := 14; //'% Desconto';
//         excel.range['H19'].ColumnWidth := 14; //'Total Unit.';

//         excel.range['A18','H18'].Borders.LineStyle := 1;
//         excel.range['A18','H18'].Borders.Weight := 2;
//         excel.range['A18','H18'].Borders.ColorIndex := 1;
//         excel.Cells[linha+1,1].formula := 'Nr. de Unidades';
//         excel.Cells[linha+1,5].formula := 'Total do Pedido (R$) ';
         //Mesclando C?lulas
  //       excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
   //      excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].MergeCells := true;

         {alinhamento horizontal no centro}
     //    excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].HorizontalAlignment := 3;
       //  excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].HorizontalAlignment := 3;


//         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
  //       excel.Cells[linha+1,4].formulaLocal := '=Soma(D19:D'+inttostr(linha)+')';
    //     excel.Cells[linha+1,8].formulalocal := '=Soma(H19:H'+inttostr(linha)+')';
      //   excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
        // excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 3;
       //  excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

         //Formatando c?lulas escritas

         //excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Font.Bold      := true;
        //  Se for salvar a aplica??o totalmente criada:
      // if not FileExists(dsLocalPanilha+'\'+dsNmPlanilha) then
      //  excel.ActiveWorkBook.Saveas(dsLocalPanilha+'\'+dsNmPlanilha,56);
 //       if  saveExcel.es(dsNmPlanilha);

   //     excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
       // excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
         // excel.quit;
      end;
     end;
     CloseFile(arq);
     _cdsItemPedido.EnableControls;

     //excel.quit;
end;



FUNCTION T_frmRelacaoPedidos.getCondicaoPagamento(Pnrcondicao:Integer):Boolean;
var
  PrazoPedido :TCondicaoPagamento;
  I : iNTEGER;
  pcParcela,
  vtparcela,
  vlPedido:Double;
  dtPrevista :TDate;
BEGIN
   _cdsCondicaoPagamentos.Close;
   _cdsCondicaoPagamentos.CreateDataSet;
   PrazoPedido:=nrParcelaPedido(Pnrcondicao);
   vlPedido      := _cdsPedido.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
   dtPrevista    := _cdsPedido.FieldByName('DT_PREVISTA').AsDateTime;
   pcParcela     := 0;
   if PrazoPedido.nrCondicaoPagamento>0 then
   begin
      pcParcela     := 100/PrazoPedido.nrCondicaoPagamento;
      vtparcela     := vlPedido/PrazoPedido.nrCondicaoPagamento;;
   end;
   FOR I:=1 TO PrazoPedido.nrCondicaoPagamento DO
   BEGIN
      setCondicaoPagamento(I,PrazoPedido.nrDiasPrazo[I],pcParcela,vtparcela,dtPrevista+PrazoPedido.nrDiasPrazo[I]);
   END;
   _cdsCondicaoPagamentos.OPEN;
   _cdsCondicaoPagamentos.FIRST;
   vtparcela:=0;
   pcParcela:=0;
   stCondicao:='';
   WHILE  NOT _cdsCondicaoPagamentos.Eof DO
   BEGIN
    if stCondicao<>'' then
       stCondicao:=stCondicao +','+ FormatFloat('##0',_cdsCondicaoPagamentosNR_DIAS.AsInteger)+' Dias'
    else
       stCondicao:=FormatFloat('##0',_cdsCondicaoPagamentosNR_DIAS.AsInteger)+' Dias';


    pcParcela:=   pcParcela  + _cdsCondicaoPagamentosPC_PARCELAS.AsFloat;
    _cdsCondicaoPagamentos.Next;
   END;
   IF vtparcela<>100 THEN
      AJustaParcelas;
END;

function T_frmRelacaoPedidos.setCondicaoPagamento(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
BEGIN
 TRY
  _cdsCondicaoPagamentos.Open;
  _cdsCondicaoPagamentos.Append;
  _cdsCondicaoPagamentosNR_DIAS.AsInteger  :=nrDias;
  _cdsCondicaoPagamentosPC_PARCELAS.AsFloat      := pcParcela;
  _cdsCondicaoPagamentosVL_PARCELAS.AsFloat      :=vlParcela;
  _cdsCondicaoPagamentosDT_PAGAMENTOS.AsDateTime :=dtPagamento;
  _cdsCondicaoPagamentos.Post;
  Result:=true;
 EXCEPT
   BEGIN
    Mensagem('Erro Na Grava??o forma Pagamento',16);
    Result:=false;
   END;
 END;
END;

PROCEDURE T_frmRelacaoPedidos.AJustaParcelas;
VAR
  nrParcelas,I: Integer;
  pcParcela : Double;
  vlAcumulado:Double;
  nrRepeticao:Integer;
BEGIN
   _cdsCondicaoPagamentos.Open;
   _cdsCondicaoPagamentos.First;
//   VT_PC_PARCELA:=0;
   vlAcumulado:=0;
   nrParcelas:= _cdsCondicaoPagamentos.RecordCount;
   nrRepeticao:=0;
   FOR I:=1 TO nrParcelas DO
   BEGIN
       pcParcela:=(100 - vlAcumulado)/(nrParcelas - nrRepeticao);
       Inc(nrRepeticao);
       vlAcumulado:= vlAcumulado + StrToFloat(FormatFloat('##000',pcParcela));
       _cdsCondicaoPagamentos.Open;
       if _cdsCondicaoPagamentos.Locate('NR_PARCELAS',I,[]) THEN
       begin
         _cdsCondicaoPagamentos.Edit;
         _cdsCondicaoPagamentosPC_PARCELAS.AsFloat:=StrToFloatDef(FormatFloat('##000',pcParcela),0);
         _cdsCondicaoPagamentos.Post;
       END;
   END;
END;

{function T_frmRelacaoPedidos.getCondicaoPagamento(nrCondicaoPagamento:Integer):String;
var
 stCondicao:String;
begin
   getCondicaoPagamento(nrCondicaoPagamento);
   //_cds
end;}


{procedure T_frmRelacaoPedidos.Imprimir(nrPedido:Integer);
var
  nrLinha,ctLinha,nrPag,
  nrTotalUnidades:Integer;
  vlPedido :Double;
  idTipoOrientacaoPagina,
  stPrazoPredido:String;
  DadosValoresPedido:TDadosValoresPedido;
  DadosCD:TDadosCD;
  DadosFornecedor:TDadosFornecedor;
begin
  DadosValoresPedido:=GetValoresPedido(nrPedido);
  DadosCD:=GetDadosCD(DadosValoresPedido.cdEmpresa);
  DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);
  stPrazoPredido:=getPrazoPedido(nrPedido,0);
  with Printer do
  begin
    nrLinha := 0;
    ctLinha :=0;
    nrTotalUnidades:=0;
    vlPedido :=0;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 08;
    nrPag   := 1;
    nrLinha := 185;
    Title := 'Pedido Compra';
    Orientation := poLandscape;
    BeginDoc;
    nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
    nrLinha:=TopoPaginaPedido(nrPag, nrLinha, nrPedido,DadosValoresPedido.dtPedido,'',DadosCD.stENDERECO+' N?. '+INTTOSTR(DadosCD.nrLogradouro),
    DadosCD.stBAIRRO,DadosCD.stCIDADE+'/'+DadosCD.stEstado,DadosCD.stCEP,FormatFloat('00000',DadosFornecedor.nrFornecedor)+' - '+DadosFornecedor.dsRazaoSocial,stCondicao);
    nrLinha:=CabecalhoPag(nrLinha,nrPag);
    _cdsItemPedido.IndexFieldNames:='NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
    _cdsItemPedido.First;
    while not _cdsItemPedido.Eof do
    begin
      inc(ctLinha);
      nrLinha:=LinhaDetalhePedido(nrLinha,
                           _cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger,
                           _cdsItemPedido.FieldByName('QUAY_Y').AsInteger,
                           _cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').AsString,
                           _cdsItemPedido.FieldByName('NM_MERCADORIA').AsString,
                           _cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString,
                           _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                           _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                           _cdsItemPedido.FieldByName('PFBY_Y').AsFloat);
       nrTotalUnidades := nrTotalUnidades +_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
       vlPedido        := vlPedido +(_cdsItemPedido.FieldByName('QUAY_Y').AsInteger*
                                    _cdsItemPedido.FieldByName('PFBY_Y').AsFloat);
      if ctLinha > 38 then
      begin
        RodaPeParcial(nrLinha,nrPag,nrTotalUnidades,vlPedido);
        Printer.NewPage;
        ctLinha := 0;
        nrLinha := 200;
        Inc(nrPag);
        nrLinha:=CabecalhoPagNovaPagina(nrLinha,nrPag);
      end;
      _cdsItemPedido.Next;
    end;
    RodaPeFinal(nrLinha,0,nrTotalUnidades,vlPedido);
   EndDoc;
  end;

end;}

Function T_frmRelacaoPedidos.AlteraItem(PnrPedido,
                                        PnrProduto,
                                        PnrDigitoProduto,
                                        PnrQuantidadePedido,
                                        PnrVerba,
                                        PcdEmpresa: Integer;
                                        PvlItem,
                                        PpcDescontopadrao,
                                        PpcDescontoAdicional,
                                        PpcVerba: Double;
                                        PidBonificado:Boolean): Boolean;
Var
  DadosProduto:TMercadoria;
   precoLista: TListaPreco;
   PrecoItem: TCalculoPreco;
   vlCustoItem,vlVerbaItem,
   pcCreditoICMS :Double;
   nrListaPrecoExcecao,
   nrDiasPrazo:Integer;
   PrazoPedido :TCondicaoPagamento;


begin
   idprecoAtual := 'S';
   if _cbxListaPreco.ItemIndex = 1 then
     idprecoAtual := 'N';
   DadosPedido:=GetValoresPedido(PnrPedido,false);
   PrazoPedido:=nrParcelaPedido(DadosPedido.nrCondicaoPagamento);
   nrDiasPrazo:=PrazoPedido.nrDiasPrazo[1];
   DadosProduto:=GetMercadoriaNova(PnrProduto,PnrDigitoProduto,0,PcdEmpresa,DadosPedido.nrOperadorLogistico,'');
  // _cdsPrecoItem:=GetListaPrecoLaboratorio(0, 1, 0, DadosPedido.nrFornecedor , PnrProduto,DadosPedido.cdEmpresa,idprecoAtual, dtSistema);
  _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, DadosPedido.nrFornecedor , PnrProduto,DadosPedido.cdEmpresa,idprecoAtual, dtSistema);

 // if PvlItem>0 then
//    precoLista := GetPrecoItem(PnrPedido,DadosPedido.cdEmpresa,PvlItem ,1, idprecoAtual);

     nrListaPrecoExcecao:=DadosPedido.nrListaPrecoExcecao;

     _cdsItemListaPreco:=nil;


    if nrListaPrecoExcecao>0 then
      _cdsItemListaPreco := AbrePrecoListaAtiva(nrListaPrecoExcecao);
      if _cdsItemListaPreco <> nil then
          _cdsItemListaPreco.open;




  // if _cdsPrecoItem.active then
    //_cdsPrecoItem.open;
{     precoLista := GetPrecoItem(PnrProduto,
                                DadosPedido.cdEmpresa,
                                DadosProduto.vlPrecoCadastro,
                                1,
                                idprecoAtual[1]);}

       precoLista := GetPrecoItem(PnrProduto,
                                  DadosPedido.cdEmpresa,
                                  DadosProduto.vlPrecoCadastro,
                                  1,
                                  idprecoAtual[1],
                                  0,
                                  nrListaPrecoExcecao);



    PpcDescontopadrao:= DadosProduto.pcDescontoPadrao;
    PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoBase,
                                     DadosProduto.vlPrecoCadastro,
                                     DadosProduto.pcRepasseCompra,
                                     DadosProduto.pcDescontoPadrao,
                                     PpcDescontoAdicional,
                                     DadosProduto.pcCreditoICMS,
                                     DadosProduto.pcIpiProduto,
                                     precoLista.PcIPILista,
                                     precoLista.pcReajustePreco,
                                     PnrQuantidadePedido,
                                     precoLista.nrListaPreco,
                                     'N',
                                     DadosProduto.idForcaRepasse,
                                     DadosProduto.idIpiLiquidoComRepasse,
                                     DadosProduto.idIpiLiquidoSemRepasse,
                                     DadosProduto.idIpiBrutoComRepasse,
                                     DadosProduto.idIpiBrutoSemRepasse,
                                     inttostr(DadosProduto.nrTipoProduto),
                                     DadosProduto.dsUndidadeFederacaoFornecedor,
                                     DadosProduto.idSuperfulo,
                                     DadosProduto.idIcmDestacado,
                                     DadosProduto.idReduzIcms,
                                     DadosProduto.idPisCofins);
    if PnrVerba > 0 then
    begin
      PrecoItem.vlVerba := CalculaPcVerba(PpcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, DadosProduto.pcIpiProduto, 0,
      DadosProduto.pcCreditoICMS, DadosProduto.nrProduto, DadosProduto.nrTipoProduto,
      PnrQuantidadePedido,DadosProduto.nrLaboratorio ,DadosProduto.idPis);
    end;

    vlCustoItem:=PrecoItem.vlPrecoCusto;

    vlVerbaItem:=0;
    if PnrVerba>0 then
      vlVerbaItem:=PrecoItem.vlVerba;
    if PidBonificado then
    begin
      vlVerbaItem:=_cdsItemPedido.FieldByName('vcci_y').asfloat;
    end;


   AtualizaItemPedido(DadosPedido.nrPedido,
                      DadosProduto.nrProduto,
                      PnrQuantidadePedido,
                      0,
                      nrDiasPrazo,
                      PnrVerba,
                      0,
                      _cdsItemPedido.FieldByName('nr_operador_logistico').AsInteger,
                      _cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger,
                      _cdsItemPedido.FieldByName('QT_SUGERIDA').AsInteger,
                      'N',
                      'N',
                      'N',
                      PpcDescontoPadrao,
                      PpcDescontoADicional,
                      0,
                      PpcVerba,
                      0,
                      0,
                      PrecoItem.vlPrecoLiquido,
                      PrecoItem.vlPrecoLista,
                      vlCustoItem,
                      0,
                      0,
                      vlVerbaItem,
                      _cdsItemPedido.FieldByName('VL_MEDIA_VENDA').AsFloat,'Tela Rela??o Pedido',
                       DadosPedido.cdEmpresa,
                       DadosProduto.pcCreditoICMS,
                       precoLista.nrListaPreco,
                       false,
                       PidBonificado,
                       precoLista.PcIcmsCompra,0,
                       precoLista.vlBaseVenda);

      pcCreditoICMS:=DadosProduto.pcCreditoICMS;  ///  SS  33688
//      if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
  //       pcCreditoICMS:=precoLista.PcIcmsCompra;



      GravaLogItemPedido(DadosPedido.nrPedido,// NROP_Y, // NUMBER(6)
                         DadosProduto.nrProduto,// NROM_Y, // NUMBER(6)
                         PnrQuantidadePedido,// QUAY_Y, // NUMBER(7)
                         0,// CHEY_Y: INTEGER; // NUMBER(7)
                         PpcDescontopadrao,// ABTY_Y: Double; // NUMBER(5,2)
                         _cdsItemPedido.FieldByName('SITY_Y').AsString,//: String; // CHAR(1)
                         _cdsItemPedido.FieldByName('PRZY_Y').AsInteger, // NUMBER(3)
                         PrecoItem.vlPrecoLiquido, // NUMBER(17,6)
                         PrecoItem.vlPrecoLista, // NUMBER(17,6)
                         PpcDescontoAdicional, // NUMBER(5,2)
                         _cdsItemPedido.FieldByName('DFIY_Y').AsFloat, // NUMBER(5,2)
                         vlCustoItem,//: Double; // NUMBER(17,6)
                         PnrVerba,//: INTEGER; // NUMBER(6)
                          0, // NOT NULL NUMBER(13,2)
                          0,//VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
                          'N',//ID_MARGEM, // CHAR(1)
                          'N',//ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
                          PpcVerba, // NUMBER(5,2)
                          vlVerbaItem,//: Double; // NUMBER(13,2)
                          0,//QT_BONIFICADA NOT NULL NUMBER(6)
                          0,//PC_BONIFICACAO NOT NULL NUMBER(5,2)
                          0,//PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
                          _cdsItemPedido.FieldByName('NR_OPERADOR_LOGISTICO').AsInteger, // NOT NULL NUMBER(6)
                          _cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger, // NUMBER(3)
                          _cdsItemPedido.FieldByName('QT_SUGERIDA').AsInteger,//: INTEGER; // NUMBER(7)
                          _cdsItemPedido.FieldByName('VL_MEDIA_VENDA').AsFloat,//: Double; // NUMBER(13,2)
                          precoLista.nrListaPreco, // NUMBER(6)
                          precoLista.pcReajustePreco,//  PC_MUDANCA_PRECO: Double;
                          DadosPedido.cdEmpresa,// CD_EMPRESA:Integer;
                           pcCreditoICMS{:Double});





end;

procedure T_frmRelacaoPedidos.BitBtn1Click(Sender: TObject);
begin
//  inherited;

//AltualizaPrecoPedido(_cdsPedido.FieldByName('NROP_P').AsInteger);

 nrPedidoAlteracao:=_cdsPedido.FieldByName('NROP_P').AsInteger;
 Application.CreateForm(T_frmAtualizaprecoPedido,_frmAtualizaprecoPedido);

 _frmAtualizaprecoPedido.ShowModal;
 _frmAtualizaprecoPedido.Free;
 AbreItensPedidos(nrPedidoAlteracao);
_cdsPedido.First;






end;

procedure T_frmRelacaoPedidos._btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisaPedido;

end;

procedure T_frmRelacaoPedidos._chkSomenteItemAtivosClick(Sender: TObject);
begin
  inherited;
  if not _chkSomenteItemAtivos.Checked then
       _cdsItemPedido.Filtered:=false
  else
     with  _cdsItemPedido do
      begin
         Filter:='SITY_Y=''N''';
         Filtered:=true;
      end;

end;

procedure T_frmRelacaoPedidos.PesquisaPedido;
var
 dtInicio,dtFinal :String[10];
 idStatus :String[10];
 nrPedidoLocal,cdProdutoLocal :Integer;
begin
  //inherited;
  case _rgStatus.ItemIndex of
    0: idStatus:=' ';
    1: idStatus:='F';
    2: idStatus:='N';
    3: idStatus:='Z';
  end;
  dtInicio:=FormatDateTime('dd/mm/yyyy',_dtpDtInicio.Date);
  dtFinal:=FormatDateTime('dd/mm/yyyy',_dtpDtFinal.Date);
  nrPedidoLocal:=StrToIntDef(_edtNrPedido.Text,0);
  cdProdutoLocal:=StrToIntDef(_edtCodigoProduto.Text,0);
  _cdsPedido.ControlsDisabled;
  _cdsItemPedido.DisableControls;
  _cdsItemPedido.close;
  AbrePedidosComprador(StrToIntDef(_edtNumeroComprador.Text,nrCompradorSistema),
                       StrToIntDef(_edtNumeroFornecedor.Text,0),idStatus
                      ,StrToDateDef(dtInicio,dtSistema),
                      StrToDateDef(dtFinal,dtSistema),
                      nrPedidoLocal,0,
                      cdProdutoLocal);
  if not _cdsPedido.IsEmpty then
  begin
        _btnParaExcel.Enabled:=True;
        _btnExcelPedido.Enabled:=true;

       getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);


        NR_TOTAL_ITENS   :=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_TOTAL_ITENS.AsVariant),0);
        NR_TOTAL_UNIDADES:=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_TOTAL_UNIDADES.AsVariant),0);
        NR_UNIDADES_FAT  :=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_UNIDADES_FAT.AsVariant),0);
        QT_UNIDADES_FAT  :=StrToIntDef(FormatFloat('########0',_cdsPedidoQT_UNIDADES_FAT.AsVariant),0);


        VL_PEDIDO_CUSTO     := _cdsPedidoVL_PEDIDO_CUSTO.AsVariant;
        VL_PEDIDO_FORNECEDOR:= _cdsPedidoVL_PEDIDO_FORNECEDOR.AsVariant;
        VL_FATURADO_CUSTO   := _cdsPedidoVL_FATURADO_CUSTO.AsVariant;
        VL_FATURADO_FORNEC  := _cdsPedidoVL_FATURADO_FORNEC.AsVariant;

       _edtTotalItens.Text           :=FormatFloat('###,###,##0',NR_TOTAL_ITENS);
       _edtNumerosUnidades.Text      :=FormatFloat('###,###,##0',NR_TOTAL_UNIDADES);
       _edtNumeroItensFaturado.Text  :=FormatFloat('###,###,##0',NR_UNIDADES_FAT);
       _edtQuantidadeFaturada.Text   :=FormatFloat('###,###,##0',QT_UNIDADES_FAT);

       _edtTotalPedidoCompra.Text    :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PEDIDO_CUSTO.AsVariant);
       _edtTotalPedidoForncedor.Text :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PEDIDO_FORNECEDOR.AsVariant);
       _edtTotaFaturadoCompra.Text   :=FormatFloat('###,###,##0.00',_cdsPedidoVL_FATURADO_CUSTO.AsVariant);
       _edtTotalFaturaroFornec.Text  :=FormatFloat('###,###,##0.00',_cdsPedidoVL_FATURADO_FORNEC.AsVariant);

       _edtTotalPedidoLiquido.Text  :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PED_LIQUIDO.AsVariant);


  end;
  _cdsPedido.EnableControls;
  _cdsItemPedido.EnableControls;
  idNavegando:=true;

end;


{function T_frmRelacaoPedidos.GetPrecoItem(nrProduto,
                                          cdEmpresa: Integer;
                                          vlPrecoFornecedor,
                                           pcDescontoAbatimento: double; IdPrecoAtual: Char)
  : TListaPreco;
//var
// idprecoAtual:String[1];
begin
  //idprecoAtual:='N';
  with _cdsPrecoItem do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +inttostr(cdEmpresa);
    filtered := true;
    // Params.ParamByName()
  end;
  result.vlPrecoLista := vlPrecoFornecedor;
  result.nrListaPreco := 0;
  if not _cdsPrecoItem.IsEmpty then
  begin
    result.vlPrecoLista     := _cdsPrecoItem.FieldByName('VL_BASE_COMPRA').AsFloat * pcDescontoAbatimento;
    result.pcReajustePreco  := 0;
    result.nrListaPreco     := _cdsPrecoItem.FieldByName('CD_LISTA_GAM').AsInteger;
    Result.PcIcmsCompra     := _cdsPrecoItem.FieldByName('PC_ICMS_COMPRA').AsFloat;
    Result.vlBaseVenda      := _cdsPrecoItem.FieldByName('VL_BASE_VENDA').AsFloat;
    if IdPrecoAtual = 'N' then
    begin
      result.vlPrecoLista     := _cdsPrecoItem.FieldByName('VL_LISTA_ANTERIOR').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco  := _cdsPrecoItem.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      result.nrListaPreco     := _cdsPrecoItem.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.PcIcmsCompra     := _cdsPrecoItem.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.vlBaseVenda      := _cdsPrecoItem.FieldByName('VL_BASE_VENDA').AsFloat;

    end;
    if result.pcReajustePreco < 0 then
      result.pcReajustePreco := 0

  end;
end; }


function T_frmRelacaoPedidos.GetPrecoItem(PnrProduto,
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
      Result.nrListaPreco    := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase     := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra    := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
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



procedure T_frmRelacaoPedidos.setDesabilitaEdicaoItem;
var
  I: Integer;
begin
 if _cdsItemPedido.active then
 begin

  for I := 0 to _cdsItemPedido.FieldCount-1 do
      _cdsItemPedido.Fields[i].ReadOnly:=true;



   _cdsItemPedido.Fields[09].ReadOnly:=false;
   _cdsItemPedido.Fields[15].ReadOnly:=false;
   _cdsItemPedido.Fields[17].ReadOnly:=false;


   _cdsItemPedido.FieldByName('QUAY_Y').ReadOnly:=FALSE;
   _cdsItemPedido.FieldByName('NRVV_Y').ReadOnly:=FALSE;
   _cdsItemPedido.FieldByName('PC_VERBA').ReadOnly:=FALSE;







   _cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO').ReadOnly:=true;


    _cdsItemPedido.FieldByName('CD_PRODUTO').ReadOnly:=true;
    _cdsItemPedido.FieldByName('NM_MERCADORIA').ReadOnly:=true;
    _cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').ReadOnly:=true;
    _cdsItemPedido.FieldByName('NROP_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('NROM_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('ABTY_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('CHEY_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO').ReadOnly:=true;
    _cdsItemPedido.FieldByName('PFBY_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('VCCI_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').ReadOnly:=true;
    _cdsItemPedido.FieldByName('PC_MUDANCA_PRECO').ReadOnly:=true;
    _cdsItemPedido.FieldByName('SITY_Y').ReadOnly:=true;
    _cdsItemPedido.FieldByName('VL_VERBA').ReadOnly:=true;
    _cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE').ReadOnly:=true;
    _cdsItemPedido.FieldByName('QT_BONIFICADA').ReadOnly:=true;
    _cdsItemPedido.FieldByName('QT_SUGERIDA').ReadOnly:=true;




 end;

end;

procedure T_frmRelacaoPedidos.CarregaEmpresa;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('and ID_SITUACAO_EMPRESA=''A''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('ORDER BY 1');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;
    _cbxOpcaoCDs.Items.Add('00 - Todos');
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add( FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOpcaoCDs.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;





{FUNCTION T_frmRelacaoPedidos.getCondicaoPagamento(Pnrcondicao:Integer):Boolean;
var
  PrazoPedido :TCondicaoPagamento;
  I : iNTEGER;
  pcParcela,
  vtparcela,
  vlPedido:Double;
  dtPrevista :TDate;
BEGIN
   _cdsCondicaoPagamentos.Close;
   _cdsCondicaoPagamentos.CreateDataSet;
   PrazoPedido:=nrParcelaPedido(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
   vlPedido      := _cdsPedido.FieldByName('VL_FINACEIRO').AsFloat;
   dtPrevista    := _cdsPedido.FieldByName('DT_PREVISTA').AsDateTime;
   pcParcela     := 100/PrazoPedido.nrCondicaoPagamento;
   vtparcela     := vlPedido/PrazoPedido.nrCondicaoPagamento;;
   FOR I:=1 TO PrazoPedido.nrCondicaoPagamento DO
   BEGIN
      setCondicaoPagamento(I,PrazoPedido.nrDiasPrazo[I],pcParcela,vtparcela,dtPrevista+PrazoPedido.nrDiasPrazo[I]);
   END;
   _cdsCondicaoPagamentos.OPEN;
   _cdsCondicaoPagamentos.FIRST;
   vtparcela:=0;
   pcParcela:=0;
   WHILE  NOT _cdsCondicaoPagamentos.Eof DO
   BEGIN
    pcParcela:=   pcParcela  + _cdsCondicaoPagamentosPC_PARCELAS.AsFloat;
    _cdsCondicaoPagamentos.Next;
   END;
   IF vtparcela<>100 THEN
      AJustaParcelas;
END;}



{procedure T_frmRelacaoPedidos.SendToOpenOffice(aDataSet: TDataSet);
var
   OpenDesktop, Calc, Sheets, Sheet: Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Coluna
   j : Integer; // Linha
   teste : string;
begin
   Screen.Cursor      := crSQLWait;
   aDataset.Open;
   aDataset.Last;

   // Cria o link OLE com o OpenOffice
   if VarIsEmpty(OpenOffice) then
      OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
   Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

   // Inicia o Calc
   OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
   Calc        := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, VarArrayCreate([0, - 1], varVariant));
   Sheets      := Calc.Sheets;
   Sheet       := Sheets.getByIndex(0);

   // Cria linha de cabe?alho
   i := 0;
   while i <= aDataset.FieldCount - 1 do begin
         Sheet.getCellByPosition(i,0).setString(aDataset.Fields[i].FieldName);
         i := i + 1;
   end;

   // Preenche a planilha
   j := 1;
   aDataset.First;
   while not aDataset.Eof do
   begin
         i := 0;
         while i <= aDataset.FieldCount - 1 do
         begin
              if aDataset.Fields[i].DataType in [ftDate, ftTime, ftDateTime] then
              begin
                 if ((DateToStr(aDataset.Fields[i].Value) <> Null) and (DateToStr(aDataset.Fields[i].Value) <> ??)) then
                    Sheet.getCellByPosition(i,j).SetString(aDataset.Fields[i].Value);
              end
              else if aDataset.Fields[i].DataType in [ftSmallint, ftInteger, ftLargeint] then
              begin
                 if ((IntToStr(aDataset.Fields[i].Value) <> Null) and (IntToStr(aDataset.Fields[i].Value) <> ??)) then
                    Sheet.getCellByPosition(i,j).SetValue(aDataset.Fie0A   Sheets      := Calc.Sheets;
   Sheet       := Sheets.getByIndex(0);

   // Cria linha de cabe?alho
   i := 0;
   while i <= aDataset.FieldCount - 1 do begin
         Sheet.getCellByPosition(i,0).setString(aDataset.Fields[i].FieldName);
         i := i + 1;
   end;

   // Preenche a planilha
   j := 1;
   aDataset.First;
   while not aDataset.Eof do
   begin
         i := 0;
         while i <= aDataset.FieldCount - 1 do
         begin
              if aDataset.Fields[i].DataType in [ftDate, ftTime, ftDateTime] then
              begin
                 if ((DateToStr(aDataset.Fields[i].Value) <> Null) and (DateToStr(aDataset.Fields[i].Value) <> ??)) then
                    Sheet.getCellByPosition(i,j).SetString(aDataset.Fields[i].Value);
              end
              else if aDataset.Fields[i].DataType in [ftSmallint, ftInteger, ftLargeint] then
              begin
                 if ((IntToStr(aDataset.Fields[i].Value) <> Null) and (IntToStr(aDataset.Fields[i].Value) <> ??)) then
                    Sheet.getCellByPosition(i,j).SetValue(aDataset.Fields[i].Value);
              end
              else if aDataset.Fields[i].DataType in [ftFloat, ftCurrency] then
              begin
                 if ((FloatToStr(aDataset.Fields[i].Value) <> Null) and (FloatToStr(aDataset.Fields[i].Value) <> ??)) then
                    Sheet.getCellByPosition(i,j).SetValue(aDataset.Fields[i].Value);
              end
              else begin
                 if ((aDataset.Fields[i].Value <> Null) and (aDataset.Fields[i].Value <> ??)) then
                 begin
                    teste := ??;
                    teste := aDataset.Fields[i].Value;
                    Sheet.getCellByPosition(i,j).SetString(teste);
                 end;
              end;

               i := i + 1;
         end;
         aDataset.Next;
         j := j + 1;
   end;
   Screen.Cursor      := crArrow;
   // Desconecta o OpenOffice
   OpenOffice         := Unassigned;
   ShowMessage(?Planilha Gerada?);
end;       }


procedure T_frmRelacaoPedidos.AltualizaPrecoPedido(PnrPedido:Integer);
begin

  AbreItensPedidos(PnrPedido);

  _cdsItemPedido.First;

  while not _cdsItemPedido.Eof do
  begin

    _cdsItemPedido.Next;
  end;



end;

function T_frmRelacaoPedidos.SetListaPrecoAtiva(PnrLista,
                                                PnrProduto,
                                                PnrEmpresa: Integer): TListaPrecoAtiva;
begin

  Result.vlPrecoLista := 0;
  Result.vlPrecoComdesconto := 0;
  Result.PcIcmsCompra := 0;
  Result.pcDescontoAdicional := 0;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;

  if _cdsItemListaPreco.Locate('CD_PRECO_FORNECEDOR_EXCECAO;CD_MERCADORIA;CD_EMPRESA',VarArrayOf([PnrLista, PnrProduto, PnrEmpresa]), []) then
  begin
    Result.vlPrecoLista        := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA').AsFloat;
    Result.vlPrecoComdesconto  := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;
    Result.pcDescontoAdicional := _cdsItemListaPreco.FieldByName('PC_DESCONTO_COMPRA').AsFloat;
    Result.nrListaPreco        := PnrLista;
    Result.nrVerba             := _cdsItemListaPreco.FieldByName('NR_VERBA').AsInteger;

  end;

end;

end.
