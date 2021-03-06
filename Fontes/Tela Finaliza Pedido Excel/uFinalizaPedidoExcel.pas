unit uFinalizaPedidoExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ComCtrls, Grids, DBGrids, StdCtrls, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, Buttons, DateUtils, uAuxiliarCompras, uProduto,
  Gauges, uRotinasGenericas, Spin, sqlExpr, imouse, StrUtils, MATH,shellApi,
  ComObj,
  uDm, uRelatorioVerbas, uUltimosPedidos, uSqlConsultaSistemas,
  uPendenciaItem, uJustificativa, uObservacaoNoFornecedor,
  uObservacaoInativacaoBloqueio;

type
  T_frmFinalizaPedidoExcel = class(TForm)
    GroupBox8: TGroupBox;
    _dbgPedidoPronto: TDBGrid;
    GroupBox3: TGroupBox;
    _dbgFiltroPedido: TDBGrid;
    _grbParcelaPrazo: TGroupBox;
    _dbgPrazoSC: TDBGrid;
    Label19: TLabel;
    _chkObservacaoPedido: TCheckBox;
    _edtObservacaoPedido: TEdit;
    _edtNrVerba: TEdit;
    _chkBonificaPedido: TCheckBox;
    _cbOPeradorLogistico: TComboBox;
    Label18: TLabel;
    _btnConfirma: TBitBtn;
    _dtpPedido: TDateTimePicker;
    _chkImprimir: TCheckBox;
    _chkGeraExcel: TCheckBox;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _stbCompras: TStatusBar;
    _btnFechaCancela: TBitBtn;
    _dsEmpresaPedido: TDataSource;
    _cdsEmpresaPedido: TClientDataSet;
    _cdsPedido: TClientDataSet;
    _dsPedido: TDataSource;
    _cdsCondicaoPagamento: TClientDataSet;
    _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField;
    _cdsCondicaoPagamentoNR_DIAS: TIntegerField;
    _dsCondicaoPagamento: TDataSource;
    _cdsPeEstoque: TClientDataSet;
    _cdsTabelaLeadTime: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure _btnFechaCancelaClick(Sender: TObject);
    procedure _dbgPedidoProntoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgFiltroPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgFiltroPedidoDblClick(Sender: TObject);
    procedure _dbgPrazoSCDblClick(Sender: TObject);
    procedure _chkObservacaoPedidoClick(Sender: TObject);
    procedure _btnConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    stPedido:String;
    stFiltroPedidoEmpresa: String;
    procedure CarregaEmpresaPedido;
    function FiltroPedidoNaoFechados: String;
    procedure SetEmpresaPedidoFinal(PTabela: TClientDataSet);
    procedure setGridPedidoEmpresa(PTabela: TClientDataSet);
    function AbreItemPedidoMultiEmpresa(PstPedido: String; PnrMercadoria,
      PcdEmpresa: Integer; PidSituacao: String): Boolean;
    procedure SetNomeCampoItemPrePedido(TabelaPedido: TClientDataSet);
    procedure SetEmpresaPedidoInico(PTabela: TClientDataSet);
    procedure filtroPedido(PstEmpresa: String);
    function SetEmpresaPedido(PTabela: TClientDataSet;
      PidDesligaFiltro: Boolean): TDadosEmpresa;
    procedure PrazoPedido(PnrDiasPrazo: Integer);
    procedure CarregaPrazoPedido(PnrDiasPrazo: Integer);
    procedure EliminaCondicaoPagamento;
    function PrazoPagamento(tabela: TClientDataSet): string;
    function setDiasEstoque(PnrEmpresa: Integer): Integer;
    function carreagaDiasEstoque(PnrFornencedor: Integer): Integer;
    function ListaDiasEstoqueCD(PstEmpresa: String): TClientDataSet;
    function SetStatusPedidoGerado(PidStatus: String): Boolean;
    procedure GerarExcelPedidoLocal(PnrPedido: Integer; PidPrecoCusto,
      PidPercentualDesconto: Char);
    procedure EncerraPedido(PidConfirma: Boolean);
    function SetLeadTime(PnrEmpresa: Integer;
      PidTermoLabil: String): TDadosLeadTime;
    procedure ZeraNumeroPedido;
    function AbreLeadTime(PnrFornecedor: Integer): boolean;
    procedure setNumeroOperador(PnrFornecedor, PcdOperador: Integer);
    { Private declarations }
  public
    { Public declarations }
    DadosFornecedor:TDadosFornecedor;

  end;

var
  _frmFinalizaPedidoExcel: T_frmFinalizaPedidoExcel;
   PedidoEmpresa     : Array of Integer;
   stPedidoFechando:String;
   NrFornecedorFechaPedido,
   NrDiasEstoqueCompradorFechaPedido,
   nrDiasPrazo:Integer;
   DadosFornecedorFechaPedido:TDadosFornecedor;
   DadosFrequenciaCompraFechaPedido: TDadosFrequencia;
   DadosLeadTimeFechaPedido :TDadosLeadTime;

   cdoperadorLogisticoPedidoFecha :integer;


implementation

{$R *.dfm}


procedure T_frmFinalizaPedidoExcel.CarregaEmpresaPedido;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
  stPedidoAtivos:String;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';
      stPedidoAtivos:=FiltroPedidoNaoFechados;
      with stQry do
      begin

      Add('SELECT NROP_Y , CD.CD_EMPRESA,ID_UNIDADE_FEDERACAO,');
      Add('NM_EMPRESA,Count(*) nr_item,''N'' as ID_PEDIDO_GERADO,''S'' as ID_SELECIONADO');
     Add('FROM');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI ITEM,');
     Add('ACESSO.DC_EMPRESA CD');
     Add('WHERE');
     Add('NROP_P=NROP_Y');
     Add('AND CD.CD_EMPRESA=capa.CD_EMPRESA');
     Add('AND QUAY_Y>0');
     Add('AND ID_EMPRESA_FISICA=''S''');
     Add('AND NROP_Y In('+stPedidoAtivos+')');
     Add('GROUP BY NROP_Y ,CD.CD_EMPRESA,NM_EMPRESA,');
     Add('ID_UNIDADE_FEDERACAO');;
      end;
      stQry.SaveToFile('c:\temp\qryEmpresaPedido.sql');
      with _cdsEmpresaPedido do
      begin
        close;
        CommandText := stQry.Text;
        open;
        First
      end;
      setGridPedidoEmpresa(_cdsEmpresaPedido);
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);

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


function T_frmFinalizaPedidoExcel.FiltroPedidoNaoFechados:String;
var
 i:Integer;
begin
    Result:=EmptyStr;
    for I := 0 to High(PedidoEmpresa) do
    if PedidoEmpresa[I] > 0 then
       if Result='' then
          Result := IntToStr(PedidoEmpresa[i])
       else
          Result := Result +','+ IntToStr(PedidoEmpresa[i]);

   stPedido:=Result;
end;

procedure T_frmFinalizaPedidoExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmFinalizaPedidoExcel.FormShow(Sender: TObject);
begin
  _cdsCondicaoPagamento.close;
  _cdsCondicaoPagamento.CreateDataSet;

 _dtpPedido.Date := dtSistema;


 AbreItemPedidoMultiEmpresa(stPedidoFechando,0,0,'');
 CarregaEmpresaPedido;
 CarregaPrazoPedido(DadosFornecedorFechaPedido.nrPrazoPedido);
 DadosFrequenciaCompraFechaPedido := GetFrequenciaEstoqueMaximo (DadosFornecedorFechaPedido.nrGrupoFornecedor);
 AbreLeadTime(DadosFornecedorFechaPedido.nrFornecedor);
 setNumeroOperador(DadosFornecedorFechaPedido.nrFornecedor,0);
 _cdsPeEstoque := ListaDiasEstoqueCD('');


end;

procedure T_frmFinalizaPedidoExcel.SetEmpresaPedidoFinal(PTabela: TClientDataSet);
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_PEDIDO_GERADO=''N''';
      Filtered := true;
      First;
    end;
  end;

end;


procedure T_frmFinalizaPedidoExcel.setGridPedidoEmpresa(PTabela: TClientDataSet);
begin

  TIntegerField(_cdsEmpresaPedido.FieldByName('NROP_Y')).DisplayLabel := 'Nr.Pedido';
  TIntegerField(_cdsEmpresaPedido.FieldByName('NROP_Y')).DisplayWidth := 10;

  TIntegerField(_cdsEmpresaPedido.FieldByName('CD_EMPRESA')).DisplayLabel := 'Nr.CD.';
  TIntegerField(_cdsEmpresaPedido.FieldByName('CD_EMPRESA')).DisplayWidth := 3;

  TStringField(_cdsEmpresaPedido.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayLabel := 'UF';
  TStringField(_cdsEmpresaPedido.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayWidth := 02;

  TStringField(_cdsEmpresaPedido.FieldByName('NM_EMPRESA')).DisplayLabel := 'Nome CD';
  TStringField(_cdsEmpresaPedido.FieldByName('NM_EMPRESA')).DisplayWidth := 30;

  TIntegerField(_cdsEmpresaPedido.FieldByName('nr_item')).DisplayLabel := 'Nr.Itens';
  TIntegerField(_cdsEmpresaPedido.FieldByName('nr_item')).DisplayWidth := 09;

//--  ,''S'' as
  _cdsEmpresaPedido.FieldByName('ID_PEDIDO_GERADO').Visible :=false;
  _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').Visible :=false;

end;



function T_frmFinalizaPedidoExcel.AbreItemPedidoMultiEmpresa(PstPedido: String;
  PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROP_Y , ');
    stQry.Add('ID_UNIDADE_FEDERACAO AS CD,');
    stQry.Add('CASE');
    stQry.Add('WHEN COMPRA.cd_empresa_crossdocking=0  THEN ''N''');
    stQry.Add('else  ''S''');
    stQry.Add('END OCD,');
    stQry.Add('Produto.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y ,QT_SUGERIDA , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('PUNY_Y*QUAY_Y as VT_ITEM,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,Produto.CD_MERCADORIA,');
    stQry.Add('VL_MEDIA_VENDA,NROM_Y,ITEM.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=ITEM.CD_EMPRESA');
    stQry.Add('AND NROM_Y=PRODUTO.CD_MERCADORIA');
    stQry.Add('AND PRODUTO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND ITEM.CD_EMPRESA=COMPRA.CD_EMPRESA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND QUAY_Y>0');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + ')');
    stQry.Add('ORDER BY nm_mercadoria,ds_apresentacao_mercadoria,cd_produto ,ITEM.CD_EMPRESA');
    stQry.SaveToFile('C:\temp\qryItemPedido.sql');

    with _cdsPedido do
    begin
      close;
      CommandText := stQry.Text;
      // Params.ParamByName('PstPedido').AsString := PstPedido;
      // if PnrMercadoria > 0 then
      // Params.ParamByName('PnrMercadoria').AsInteger := PnrMercadoria;
      open;
      First;
    end;
    Result := false;
    // TotalizaPedido(PnrPedidoSC, 0, '');
    if not _cdsPedido.IsEmpty then
    begin
      _cdsPedido.IndexFieldNames :=
        'nm_mercadoria;ds_apresentacao_mercadoria;cd_produto;CD_EMPRESA';
      SetNomeCampoItemPrePedido(_cdsPedido);
      Result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;


procedure T_frmFinalizaPedidoExcel.SetNomeCampoItemPrePedido(TabelaPedido
  : TClientDataSet);
begin
  if TabelaPedido.Active then
  begin
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayLabel := 'Nr.Pedido';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROP_Y').ReadOnly:=true;

    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayLabel :='Nr.Produto';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROM_Y').ReadOnly:=true;


    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayLabel :='Qtd. Pedido';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayLabel :=
      'Desc.Padr?o';
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayWidth := 07;
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayFormat := '##0.00';
    TabelaPedido.FieldByName('ABTY_Y').readOnly:=true;

    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayLabel := 'Status';
    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayWidth := 06;


    TStringField(TabelaPedido.FieldByName('OCD')).DisplayLabel := 'O.C.D';
    TStringField(TabelaPedido.FieldByName('OCD')).DisplayWidth := 05;
    //TabelaPedido.FieldByName('OCD').readOnly:=true;


    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayLabel := 'Prazo';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayLabel := 'Pre?o Unit.';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayLabel :='Total Item';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayLabel :='Pre?o Fornecedor';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayLabel :='Desc. Adic.';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayLabel :='Pre?o Custo';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayLabel :='Nr.Verba';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :='Vlr. Marg. Padr?o';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat:= '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel:='Vlr. Marg. Negociada';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayWidth := 12;

    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayLabel :='Id Margem';
    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayLabel := 'Id Desc. Acumul.';
    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayLabel :=
      'Qtdade Bonif.';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :=
      '% Bonifica??o';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :=
      '% Desc. OL';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayLabel := 'Cd Operador Log.';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayLabel :='Cod. Prod.';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayWidth := 07;
    TabelaPedido.FieldByName('CD_PRODUTO').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:= 'Nome';
    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('NM_MERCADORIA').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel := 'Apersenta??o';
    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').ReadOnly:=true;

    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayLabel :=
      'Tipo Produto';
    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayWidth := 01;

    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
      'Dias Estq.com Ped.';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;
    TabelaPedido.FieldByName('QT_SUGERIDA').ReadOnly := true;

    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

procedure T_frmFinalizaPedidoExcel._btnConfirmaClick(Sender: TObject);
var
  idStatus,
  idStatusCapa,
  idPrecoCusto,
  idMostraDesconto,
  stObservacao, stPrazo: string;
  cdPagamento,
  nrEmpresaFinal,
  i,
  NrDiasEstoqueComprador,
  nrEmpresa,
  nrVerba,
  NrPedido: Integer;
  DadosValoresPedido: TDadosValoresPedido;
  DadosPedido : TDadosValoresPedido;


begin
   SetEmpresaPedidoInico(_cdsEmpresaPedido);
  _cdsEmpresaPedido.First;

  nrVerba:=StrToIntDef(_edtNrVerba.Text,0);
  dtPedido:=strtodate(FormatDateTime('dd/mm/yyyy',_dtpPedido.Date));
  repeat
    if cdoperadorLogisticoPedidoFecha=1 then
      cdoperadorLogisticoPedidoFecha:=StrToIntDef(copy(_cbOPeradorLogistico.Items.Strings[_cbOPeradorLogistico.ItemIndex] ,1,4),1);

    while not _cdsEmpresaPedido.eof do
    begin
      idStatus := 'N';
      idPrecoCusto := 'N';
      if _chkRelatorioPrecoCusto.Checked then
        idPrecoCusto := 'S';
      idMostraDesconto := 'N';
      if _chkMostraDesconto.Checked then
        idMostraDesconto := 'S';
      stObservacao := ' ';
      if _chkObservacaoPedido.Checked then
        stObservacao := _edtObservacaoPedido.Text;



      NrPedido := PedidoEmpresa[_cdsEmpresaPedido.FieldByName('CD_EMPRESA').AsInteger];
      nrEmpresa := _cdsEmpresaPedido.FieldByName('CD_EMPRESA').AsInteger;
      stPrazo := PrazoPagamento(_cdsCondicaoPagamento);
      cdPagamento := AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento.recordCount);
      DadosValoresPedido := GetValoresPedido(NrPedido, false);
      NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);

      if _chkBonificaPedido.Checked then
          begin
                nrVerba := StrToIntDef(_edtNrVerba.Text, 0);
                setBonificaPedido(NrPedido, 0, nrVerba);
                if DadosValoresPedido.nrPedidoVinculado > 0 then
                  setBonificaPedido(DadosValoresPedido.nrPedidoVinculado,
                    0, nrVerba);

              end;



     // Status P quando esta alterando Pedido Especidico
     idStatusCapa:=idStatus;
      if DadosValoresPedido.idStatusPedido='P'  then
         idStatusCapa:='P';

      if nrVerba=0 then
         nrVerba:=DadosValoresPedido.nrGeracaoVerba;

      if NrPedido > 0 then
      begin
        // Emiminando Itens Pedido n?o comprado.
        EliminaItemQuantidadeZerada(NrPedido);
        if AtualizaCapaPedido(NrPedido,
                              cdPagamento,
                              cdoperadorLogisticoPedidoFecha,
                              DadosLeadTimeFechaPedido.vlLeadTime,
                              idStatusCapa,
                              stObservacao,
                              false,// Atualiza agenda
                              dtPedido,
                              dtPedido+DadosFrequenciaCompraFechaPedido.nrFrequenciaCompra,
                              dtPedido + DadosFrequenciaCompraFechaPedido.nrFrequenciaCompra,
                              NrDiasEstoqueComprador,
                              nrVerba,_chkBonificaPedido.Checked,0) then
          begin
           DaDosPedido:=GetValoresPedido(nrPedido,false);

           if DaDosPedido.nrItensPedido=0 then
           begin
              SetStatusPedidoGerado('S');
              PedidoEmpresa[nrEmpresa] := 0;

               AtualizaCapaPedido(nrPedido,
                                  cdPagamento,
                                  cdoperadorLogisticoPedidoFecha,
                                  DadosLeadTimeFechaPedido.vlLeadTime,
                                  'I',
                                  'Ped. Sem itens',
                                  false,
                                  dtPedido,
                                  dtPedido,
                                  dtPedido + 0,
                                  NrDiasEstoqueComprador,
                                  nrVerba,_chkBonificaPedido.Checked,0);
             //  AtualizaStatusItemPedido(nrPedido, 0,cdoperadorLogisticoPedido, 'I');



           end;


          if DadosPedido.nrItensPedido>0 then
          begin
           if AtualizaStatusItemPedido(NrPedido, 0,
                                       cdoperadorLogisticoPedidoFecha, idStatus) then
           begin
            SetStatusPedidoGerado('S');
            PedidoEmpresa[nrEmpresa] := 0;
            // Imprimindo Pedido
            if (_chkImprimir.Checked) then
            begin
              Imprimir(NrPedido, idPrecoCusto[1], idMostraDesconto[1]);
              if DadosValoresPedido.nrPedidoVinculado > 0 then
                Imprimir(DadosValoresPedido.nrPedidoVinculado, idPrecoCusto[1],
                  idMostraDesconto[1]);
            end;
          end;
            // Gerando Excel Pedido
          if (_chkGeraExcel.Checked) then
          begin
              if DadosValoresPedido.nrTotalUnidadesPedido > 0 then
              begin
                GerarExcelPedidoLocal(NrPedido,
                                      idPrecoCusto[1],
                                      idMostraDesconto[1]);
                if DadosValoresPedido.nrPedidoVinculado > 0 then
                  GerarExcelPedidoLocal(DadosValoresPedido.nrPedidoVinculado,
                                        idPrecoCusto[1], idMostraDesconto[1]);
              end;
            end;
              // Bonificando Pedido
              if _chkBonificaPedido.Checked then
              begin
                nrVerba := StrToIntDef(_edtNrVerba.Text, 0);
                setBonificaPedido(NrPedido, 0, nrVerba);
                if DadosValoresPedido.nrPedidoVinculado > 0 then
                  setBonificaPedido(DadosValoresPedido.nrPedidoVinculado,
                    0, nrVerba);

              end;
          end;
         end
         else
         SetStatusPedidoGerado('S');

      end;

      _cdsEmpresaPedido.Next;
    end;

    SetEmpresaPedidoInico(_cdsEmpresaPedido);
    until _cdsEmpresaPedido.IsEmpty;
    SetEmpresaPedidoFinal(_cdsEmpresaPedido);
    if  _cdsEmpresaPedido.IsEmpty then
         EncerraPedido(false);


end;

procedure T_frmFinalizaPedidoExcel._btnFechaCancelaClick(Sender: TObject);
begin
  if Confirma('Deseja Realmente Cancelar Pedidos', MB_DEFBUTTON2) = IDYES then
     EncerraPedido(true);

 //close;
end;

procedure T_frmFinalizaPedidoExcel._chkObservacaoPedidoClick(Sender: TObject);
begin
  if _chkObservacaoPedido.Checked then
  begin
    _edtObservacaoPedido.Visible := true;
    _edtObservacaoPedido.Enabled := true;
    _edtObservacaoPedido.SetFocus
  end
  else
    _edtObservacaoPedido.Enabled := false;

end;

procedure T_frmFinalizaPedidoExcel._dbgFiltroPedidoDblClick(Sender: TObject);
var
  dadosFiltroEmpresa: TDadosEmpresa;
begin
  if _cdsEmpresaPedido.Active then
    if _cdsEmpresaPedido.recordCount = 0 then
    begin
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);
      exit;
    end;

  if _cdsEmpresaPedido.Active then
  begin
    if _cdsEmpresaPedido.recordCount > 0 then
    begin
      _cdsEmpresaPedido.Edit;
      if _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString = 'S' then
        _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString := 'N'
      else
        _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString := 'S';

      SetEmpresaPedidoInico(_cdsEmpresaPedido);

      dadosFiltroEmpresa := SetEmpresaPedido(_cdsEmpresaPedido, true);
      stFiltroPedidoEmpresa := dadosFiltroEmpresa.stUF;
      filtroPedido(stFiltroPedidoEmpresa);
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);
    end;
  end;

end;

procedure T_frmFinalizaPedidoExcel._dbgFiltroPedidoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if _cdsEmpresaPedido. active then
  begin
    if odd(_cdsEmpresaPedido.RecNo) then
    begin
      _dbgFiltroPedido.Canvas.Font.Color := clBlack;
      _dbgFiltroPedido.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgFiltroPedido.Canvas.Font.Color := clBlack;
      _dbgFiltroPedido.Canvas.Brush.Color := clWhite;
    end;
  if _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString = 'S' then
  begin
    _dbgFiltroPedido.Canvas.Font.Color := clWhite;
    _dbgFiltroPedido.Canvas.Brush.Color := clGreen;
  end;
  _dbgFiltroPedido.Canvas.fillRect(Rect);
  _dbgFiltroPedido.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmFinalizaPedidoExcel._dbgPedidoProntoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if _cdsPedido <> nil then
  begin
    if _cdsPedido.Active then
    begin
      if odd(_cdsPedido.RecNo) then
      begin
        _dbgPedidoPronto.Canvas.Font.Color := clBlack;
        _dbgPedidoPronto.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPedidoPronto.Canvas.Font.Color := clBlack;
        _dbgPedidoPronto.Canvas.Brush.Color := clWhite;
      end;
    end;

    _dbgPedidoPronto.Canvas.fillRect(Rect);
    _dbgPedidoPronto.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;


end;


procedure T_frmFinalizaPedidoExcel._dbgPrazoSCDblClick(Sender: TObject);
var
 idPosicao:TBookmark;
begin
       idPosicao:=_cdsCondicaoPagamento.Bookmark;
       _cdsCondicaoPagamento.edit;
      _cdsCondicaoPagamento.Post;
     _cdsCondicaoPagamento.open;

   if _cdsCondicaoPagamento.RecordCount>1 then
   begin
     _cdsCondicaoPagamento.Bookmark:=idPosicao;
     EliminaCondicaoPagamento;
   end;

end;

procedure T_frmFinalizaPedidoExcel.SetEmpresaPedidoInico(PTabela: TClientDataSet);
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_PEDIDO_GERADO=''N'' AND ID_SELECIONADO=''S'' ';
      Filtered := true;
      First;
    end;
  end;

end;

procedure T_frmFinalizaPedidoExcel.filtroPedido(PstEmpresa: String);
begin
  _cdsPedido.Filtered := false;
  if trim(PstEmpresa) <> '' then
  begin
    with _cdsPedido do
    begin
      filter := 'CD in(' + PstEmpresa + ')';
      Filtered := true;
    end;
  end;

end;



FUNCTION T_frmFinalizaPedidoExcel.SetEmpresaPedido(PTabela: TClientDataSet;
  PidDesligaFiltro: Boolean): TDadosEmpresa;
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
      filter := 'ID_PEDIDO_GERADO=''N'' AND ID_SELECIONADO=''S''';
      Filtered := true;
      First;
    end;
    while not PTabela.eof do
    begin
      if cdMaximo < PTabela.FieldByName('CD_EMPRESA').AsInteger then
        cdMaximo := PTabela.FieldByName('CD_EMPRESA').AsInteger;

      if stcdSelecionado = '' then
      begin
        Result.stEmpresa := FormatFloat('00', PTabela.FieldByName('CD_EMPRESA')
          .AsInteger);
        Result.stUF := QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO')
          .AsString);
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
    // SetLength(PedidoEmpresa,cdMaximo+1);
    if PidDesligaFiltro then
      PTabela.Filtered := false;
  end;
end;


procedure T_frmFinalizaPedidoExcel.PrazoPedido(PnrDiasPrazo: Integer);
begin
  _cdsCondicaoPagamento.open;
  _cdsCondicaoPagamento.Append;
  _cdsCondicaoPagamento.FieldByName('NR_DIAS').AsInteger := PnrDiasPrazo;
  _cdsCondicaoPagamento.post;
  _cdsCondicaoPagamento.open;

end;


procedure T_frmFinalizaPedidoExcel.CarregaPrazoPedido(PnrDiasPrazo: Integer);
begin
   //DadosFornecedor := GetDadosLaboratorio(daNrFornecedor);
   if _cdsCondicaoPagamento <> nil then
    begin
     if _cdsCondicaoPagamento.isempty then
     begin
      PrazoPedido(DadosFornecedorFechaPedido.nrPrazoPedido);
      if _cdsCondicaoPagamento <> nil then
      begin
       _cdsCondicaoPagamento.open;
       _dsCondicaoPagamento.DataSet := _cdsCondicaoPagamento;
       _cdsCondicaoPagamento.recordCount;
      end;
     end;
    end;
end;

procedure T_frmFinalizaPedidoExcel.EliminaCondicaoPagamento;
begin
     if _cdsCondicaoPagamento.RecordCount>1 then
   begin
     if Confirma('Eliminar Prazo de Pagamento ?',MB_DEFBUTTON2)=idYes then
        _cdsCondicaoPagamento.Delete;
   end;

end;


function T_frmFinalizaPedidoExcel.PrazoPagamento(tabela: TClientDataSet): string;
var
  stPrazo: String[36];
begin
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NR_DIAS').AsInteger);
    tabela.Next;
  end;
  Result := stPrazo;
end;


function T_frmFinalizaPedidoExcel.setDiasEstoque(PnrEmpresa: Integer): Integer;
begin
  Result := 0;
    if _cdsPeEstoque <> nil then
        if _cdsPeEstoque.Locate('CD_EMPRESA', PnrEmpresa, []) then
             Result := _cdsPeEstoque.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
end;


function T_frmFinalizaPedidoExcel.carreagaDiasEstoque(PnrFornencedor: Integer): Integer;
begin
    _cdsPeEstoque := ListaDiasEstoqueCD('');

    if _cdsPeEstoque <> nil then
       _cdsPeEstoque.open;
end;

function T_frmFinalizaPedidoExcel.ListaDiasEstoqueCD(PstEmpresa: String): TClientDataSet;
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

function T_frmFinalizaPedidoExcel.SetStatusPedidoGerado(PidStatus:String):Boolean;
begin
   _cdsEmpresaPedido.Open;
   _cdsEmpresaPedido.Edit;
   _cdsEmpresaPedido.FieldByName('ID_PEDIDO_GERADO').AsString:=PidStatus;
   _cdsEmpresaPedido.post;

end;


Procedure T_frmFinalizaPedidoExcel.GerarExcelPedidoLocal(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
var
  coluna, linha,nrLinaInicial: integer;
  excel: variant;
  valor: String ;
  data,dsCondicaoPagamento  :String;
  tipo : TFieldType;
  vlDefault :Variant;
  DadosCd :TDadosCD;
  _cdsTemp :TClientDataSet;
  DadosValoresPedido:TDadosValoresPedido;
  vlItem,pcDescontoItem :Double;
  dsNmPlanilha,nmFornecedor:String;
   HDROP : THandle;

begin
  try
     try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
     except
          Application.MessageBox ('Vers?o do Ms-Excel'+
          'Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
     nrLinaInicial:=4;
     DadosValoresPedido:=GetValoresPedido(PnrPedido,false);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);
     DadosCD:=GetDadosCD(DadosValoresPedido.cdEmpresa);


     if DadosFornecedor<>NIL then
     begin

//     getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
     dsCondicaoPagamento:=getPrazoPedido(PnrPedido,0);

     //_cdsPedido.First;
     try
        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        //Formatando c?lulas escritas
        excel.range['A1','A1'].Font.Bold      := true;
        excel.cells[02,01]:='Pedido de Compra :'+inttostr(DadosValoresPedido.nrPedido);
        excel.cells[03,01]:='Data Pedido      :'+FormatDateTime('DD/MM/YYYY',DadosValoresPedido.dtPedido);
        excel.cells[04,01]:='Cond. Pagamento  :'+ dsCondicaoPagamento;

       excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(DadosValoresPedido.nrPedido);;
       excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(DadosValoresPedido.nrPedido)];


        excel.cells[06,01]:='Observa??es';
        excel.cells[07,01]:=' Informar Nr. do Nosso Pedido '+inttostr(DadosValoresPedido.nrPedido) +' na Nota Fiscal/Danfe em Dados Adicionais';
        excel.cells[08,01]:=' E no XML informar no campo correspondente (Tag compra x Ped)';
        if DadosValoresPedido.stObservacaoPedido<>'' then
        begin
          excel.cells[10,01]:='Importante.:'+DadosValoresPedido.stObservacaoPedido;
         excel.range['A10','A10'].Font.Bold      := true;
        end;
        // alterado para o nome da divisao conforme SS.: 11563 (em 28/09/2015 (Vete))
        //dsNmPlanilha:='Pedido_'+trim(DadosFornecedor.dsNomeFantasia)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';
        nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
        dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';
     //    excel.Name:=dsNmPlanilha;

        if AnsiContainsStr(DadosValoresPedido.stObservacaoPedido,'Psicotr?picos') then
           dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+inttostr(DadosValoresPedido.nrPedido) +'_Psicotropicos'+'_'+DadosCd.stEstado+'.xls';



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



        excel.cells[12,01]:='CNPJ para Faturamento:'+ DadosCd.nrCNPJ;
        excel.cells[13,01]:='Endere?o de Entrega';
        //Formatando c?lulas escritas
         excel.range['A13','A13'].Font.Bold      := true;

        excel.cells[14,01]:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        excel.cells[15,01]:='Bairro.: '+DadosCd.stBAIRRO;
        excel.cells[16,01]:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        excel.range['A16','A16'].Font.Bold      := true;
        excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: vermelhaPreto

        excel.cells[17,01]:='CEP.:'+DadosCd.stCEP;


        excel.cells[18,01]:='Cod. GAM';
        excel.cells[18,02]:='Cod.Fornec.';
        excel.cells[18,03]:='Cod.EAN';

        excel.cells[18,04]:='Qtdade';
        excel.cells[18,05]:='Nome e Apresenta??o';
        excel.cells[18,06]:='P?o. Unit.';
        excel.cells[18,07]:='% Desconto';
        excel.cells[18,08]:='Total Unit.';




         //Formatando c?lulas escritas

         excel.range['A18','G18'].Font.Bold      := true;

        linha:=18;
        coluna:=1;

         _cdstemp:=GeraTabelaItensPedidos(PnrPedido);
         _cdstemp.IndexFieldNames:='NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
        _cdstemp.First;
         while not _cdsTemp.Eof do
         begin
             if PidPrecoCusto='S' then
              vlItem:=_cdsTemp.FieldByName('PUNY_Y').AsFloat
           else
              vlItem:=_cdsTemp.FieldByName('PFBY_Y').AsFloat;

           if PidPercentualDesconto='S' then
               pcDescontoItem:=_cdsTemp.FieldByName('ABTY_Y').AsFloat+
                               _cdsTemp.FieldByName('DADY_Y').AsFloat
           else
               pcDescontoItem:=0;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=_cdsTemp.FieldByName('CD_PRODUTO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=_cdsTemp.FieldByName('CD_INTERNO_LABORATORIO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=_cdsTemp.FieldByName('CD_EAN_COMPRA').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03].NumberFormat:='#############0_);(#############0)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=_cdsTemp.FieldByName('QUAY_Y').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04].NumberFormat:='#.##0_);( #.##0,00)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=_cdsTemp.FieldByName('NM_MERCADORIA').AsString+' '+
                                                           _cdsTemp.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString ;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=vlItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06].NumberFormat:='#.##0,00_);( #.##0,00)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=pcDescontoItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07].NumberFormat:='#.##0,00_);( #.##0,00 %)';


           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=_cdsTemp.FieldByName('QUAY_Y').AsInteger*vlItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08].NumberFormat:='#.##0,00_);( #.##0,00 )';
           // Borda da lina
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 2;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;


           inc(linha);
           Inc(coluna);
           _cdsTemp.Next;
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
         if not FileExists(dsLocalPanilha+'\'+dsNmPlanilha) then
          excel.ActiveWorkBook.Saveas(dsLocalPanilha+'\'+dsNmPlanilha,56);


      //  excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     _cdsTemp.EnableControls;
     end;
  finally
        excel.quit;
     //   FreeAndNil(excel);
  end;
//   dsLocalPanilha+'\'+dsNmPlanilha
  ShellExecute(Handle, 'Open', pchar(dsNmPlanilha), nil, pchar(dsLocalPanilha+'\'), SW_SHOWNORMAL);

     //excel.quit;
end;



procedure T_frmFinalizaPedidoExcel.EncerraPedido(PidConfirma:Boolean);
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


   nrVerbaGrid:= StrToIntDef(_edtNrVerba.Text,0);

   cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedorFechaPedido.nrPrazoPedido), 1);
   for I := 0 to High(PedidoEmpresa) do
   begin
      if PedidoEmpresa[I] > 0 then
      begin
        EliminaItemQuantidadeZerada(PedidoEmpresa[I]);
        ZeraItemAuditoria(PedidoEmpresa[I]);
        DadosLeadTimeFechaPedido := SetLeadTime(I, 'N');
        //nrLeadTime := DadosLeadTime.vlLeadTime;

        AtualizaCapaPedido(PedidoEmpresa[I], cdPrazoPagamento,
          cdoperadorLogisticoPedidoFecha, DadosLeadTimeFechaPedido.vlLeadTime, 'I', 'Ped.nao confirmado',
          false, dtPedido, dtPedido,
          dtPedido + DadosFornecedorFechaPedido.nrGrupoFornecedor,NrDiasEstoqueCompradorFechaPedido,nrVerbaGrid,_chkBonificaPedido.Checked,0);
        AtualizaStatusItemPedido(PedidoEmpresa[I], 0,
          cdoperadorLogisticoPedidoFecha, 'I');
      end;
    end;
    dec(nrJanelasPedido);
    //ZeraNumeroPedido;
    close;
  end;



function T_frmFinalizaPedidoExcel.SetLeadTime(PnrEmpresa: Integer; PidTermoLabil: String): TDadosLeadTime;
begin
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


function T_frmFinalizaPedidoExcel.AbreLeadTime(PnrFornecedor: Integer):boolean;
begin
  _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(PnrFornecedor);
  if _cdsTabelaLeadTime <> nil then
    _cdsTabelaLeadTime.open;
end;


procedure T_frmFinalizaPedidoExcel.ZeraNumeroPedido;
var
  I: Integer;
begin
  for I := 0 to High(PedidoEmpresa) do
    PedidoEmpresa[I] := 0;


end;


procedure T_frmFinalizaPedidoExcel.setNumeroOperador(PnrFornecedor,PcdOperador: Integer);
var
  QryTemp: TSQLQuery;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      sql.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO as CD_OPERADOR_LOGISTICO,');
      sql.Add('DS_OPERADOR_LOGISTICO,ID_VENDA_EXCLUSIVA,ID_REGISTRA_VENDA_OL,');
      sql.Add('ID_REPOSICAO_ESTOQUE');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
      sql.Add('AND ID_SITUACAO=''A''');
      sql.Add('AND CD_FORNECEDOR=:PnrFornecedor');
      if PcdOperador>1 then
         sql.Add('AND OL.CD_OPERADOR_LOGISTICO=:PcdOperador');


      if PcdOperador=1 then
      begin
      sql.Add('UNION ALL');
      sql.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO,');
      sql.Add('''N'',''N'',''S''');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL.CD_OPERADOR_LOGISTICO=1');
      end;
      sql.Add('ORDER BY CD_FORNECEDOR');
      ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PcdOperador>1 then
       ParamByName('PcdOperador').AsInteger := PcdOperador;



      open;
      First;
    end;
    _cbOPeradorLogistico.Items.Clear;
    if not QryTemp.IsEmpty then
    begin
      _cbOPeradorLogistico.Visible := true;
      Label19.Visible := true;
    end;
    _cbOPeradorLogistico.Items.Add(FormatFloat('0000', 1) + ' - ' + 'GAM');

    while not QryTemp.eof do
    begin
      //close;
      _cbOPeradorLogistico.Items.Add(FormatFloat('0000', QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger) + ' - ' +
        QryTemp.FieldByName('DS_OPERADOR_LOGISTICO').AsString);
      QryTemp.Next;
    end;
    if _cbOPeradorLogistico.Visible then
      _cbOPeradorLogistico.ItemIndex := 0;
  finally
    FreeAndNil(QryTemp);
  end;
end;



end.
