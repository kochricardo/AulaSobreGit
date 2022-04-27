unit ufrmFinalizaPedidoExcel;

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
  T_frmPedidoImportado = class(TForm)
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
  private
    stPedido:String;
    procedure CarregaEmpresaPedido;
    function FiltroPedidoNaoFechados: String;
    procedure SetEmpresaPedidoFinal(PTabela: TClientDataSet);
    procedure setGridPedidoEmpresa(PTabela: TClientDataSet);
    function AbreItemPedidoMultiEmpresa(PstPedido: String; PnrMercadoria,
      PcdEmpresa: Integer; PidSituacao: String): Boolean;
    procedure SetNomeCampoItemPrePedido(TabelaPedido: TClientDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmPedidoImportado: T_frmPedidoImportado;
   PedidoEmpresa     : Array of Integer;


implementation

{$R *.dfm}


procedure T_frmPedidoImportado.CarregaEmpresaPedido;
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
     Add('AND CD.CD_EMPRESA=ITEM.CD_EMPRESA');
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


function T_frmPedidoImportado.FiltroPedidoNaoFechados:String;
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

procedure T_frmPedidoImportado.SetEmpresaPedidoFinal(PTabela: TClientDataSet);
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


procedure T_frmPedidoImportado.setGridPedidoEmpresa(PTabela: TClientDataSet);
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



function T_frmPedidoImportado.AbreItemPedidoMultiEmpresa(PstPedido: String;
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
    stQry.Add('WHEN (QT_BONIFICADA<>5) AND (COMPRA.ID_CROSSDOCKING=''N'') THEN ''N''');
    stQry.Add('WHEN (QT_BONIFICADA<>5) AND (COMPRA.ID_CROSSDOCKING=''S'') THEN ''N''');
    stQry.Add('WHEN (QT_BONIFICADA=5) AND (COMPRA.ID_CROSSDOCKING=''N'') THEN ''N''');
    stQry.Add('WHEN (QT_BONIFICADA=5) AND (COMPRA.ID_CROSSDOCKING=''S'') THEN ''S''');
    stQry.Add('END OCD,');
    stQry.Add('Produto.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y ,QT_SUGERIDA , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('PUNY_Y*QUAY_Y as VT_ITEM,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,Produto.CD_MERCADORIA,');
    stQry.Add('VL_MEDIA_VENDA,NROM_Y,ITEM.CD_EMPRESA,COMPRA.ID_CROSSDOCKING');
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


procedure T_frmPedidoImportado.SetNomeCampoItemPrePedido(TabelaPedido
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
      'Desc.Padrão';
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

    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayLabel := 'Preço Unit.';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayLabel :='Total Item';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayLabel :='Preço Fornecedor';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayLabel :='Desc. Adic.';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayLabel :='Preço Custo';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayLabel :='Nr.Verba';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :='Vlr. Marg. Padrão';
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
      '% Bonificação';
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


    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel := 'Apersentação';
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
      := 'Média';
  end;
end;

end.
