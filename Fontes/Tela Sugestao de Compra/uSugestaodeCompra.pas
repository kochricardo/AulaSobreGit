
unit uSugestaodeCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, FMTBcd, ComCtrls, Provider, DB, SqlExpr, DBClient, Grids,
  DBGrids, StdCtrls, uRotinasGenericas, Buttons, Printers, uProduto,ComObj,
  uAuxiliarCompras;

type
  TAuxDBGrid = class(TDBGrid);

  T_frmSugestaodeCompra = class(TForm)
    GroupBox1: TGroupBox;
    _cdsSugestaoCompra: TClientDataSet;
    _dsSugestaoCompra: TDataSource;
    _sqlSugestaoCompra: TSQLQuery;
    _dspSugestaoCompra: TDataSetProvider;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    _edtNrDiasEstoque: TEdit;
    Label1: TLabel;
    _edtNrFornecedor: TEdit;
    Label2: TLabel;
    _sqlEspecealidade: TSQLQuery;
    _cdsEspecealidade: TClientDataSet;
    _dspEspecealidade: TDataSetProvider;
    _sqlPendencia: TSQLQuery;
    _cdsPendencia: TClientDataSet;
    _dspPendencia: TDataSetProvider;
    _dbgSugestao: TDBGrid;
    _dsPedidosPendentes: TDataSource;
    _cdsPedidosPendentes: TClientDataSet;
    _cdsPedidosPendentesNR_PRODUTO: TIntegerField;
    _cdsPedidosPendentesDS_PEDIDO: TStringField;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    _dsEpecealidade: TDataSource;
    GroupBox4: TGroupBox;
    _edtTotalUnidTrimestre: TEdit;
    _edtVlEstoque: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    _edtTotalUnidMes0: TEdit;
    _edtVlVendaMes0: TEdit;
    _Mes0: TLabel;
    _VlVendaMes0: TLabel;
    _edtTotalUnidMes1: TEdit;
    _edtVlVendaMes1: TEdit;
    _Mes1: TLabel;
    _VlVendaMes1: TLabel;
    _edtTotalUnidMes2: TEdit;
    _edtVlVendaMes2: TEdit;
    _Mes2: TLabel;
    _VlVendaMes2: TLabel;
    _edtTotalUnidMes3: TEdit;
    _edtVlVendaMes3: TEdit;
    _Mes3: TLabel;
    _VlVendaMes3: TLabel;
    _cdsSugestaoCompraSomaMes0: TAggregateField;
    _cdsSugestaoCompraSomaMes1: TAggregateField;
    _cdsSugestaoCompraSomaMes2: TAggregateField;
    _cdsSugestaoCompraSomaMes3: TAggregateField;
    _cdsSugestaoCompraSomaVlMes0: TAggregateField;
    _cdsSugestaoCompraSomaVlMes1: TAggregateField;
    _cdsSugestaoCompraSomaVlMes2: TAggregateField;
    _cdsSugestaoCompraSomaVlMes3: TAggregateField;
    _cdsSugestaoCompraSomaVlrEstoque: TAggregateField;
    _btnParaExcel: TBitBtn;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    _edtTotalUniSugerida: TEdit;
    _edtValorTotalUniSugerida: TEdit;
    _edtTotalUniSugeridaCPendencia: TEdit;
    _edtValorTotalUniSugeridaCPendencia: TEdit;
    _edtTotalUnPendentes: TEdit;
    _edtValorTotalPendentesCusto: TEdit;
    _edtValorTotalPendentesFabr: TEdit;
    _cdsSugestaoCompraSomaUnidadePendentes: TAggregateField;
    _cdsSugestaoCompraSomaSugestaoCompraSPendencia: TAggregateField;
    _cdsSugestaoCompraSomaSugestaoCompraCPendencia: TAggregateField;
    _cdsSugestaoCompraSomaValorPendenciaCusto: TAggregateField;
    _cdsSugestaoCompraSomaValorPendenciaFabrica: TAggregateField;
    _cdsSugestaoCompraSomaValorSugCompraSPendencia: TAggregateField;
    _cdsSugestaoCompraSomaValorSugCompraCPendencia: TAggregateField;
    _cdsSugestaoCompraSomaUnidadeEstoque: TAggregateField;
    _btnImprimir: TBitBtn;
    _chkPendencia: TCheckBox;
    _edtNrComprador: TEdit;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    _cdsSugestaoCompraSomaVdaTrimestre: TAggregateField;
    _cdsPedidosPendentesCD_EMPRESA: TIntegerField;
    _cbxOpcaoCDs: TComboBox;
    Label12: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _dbgSugestaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _btnImprimirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _dbgSugestaoTitleClick(Column: TColumn);
    procedure _cbxOpcaoCDsEnter(Sender: TObject);
  private
    procedure ExecutaPesquisa(PnrFornecedor,PnrComprador, PnrDias,PnrCD: Integer);
    procedure setGridSugestaoCompra;
    procedure AbreEspecealidade(nrFornecedor: Integer);
    procedure AbrePendencia(nrFornecedor: Integer);
    procedure setDadosSugestao;
    procedure filtraPendencia(pnrProduto,PnrCD: Integer);
    function GravaPedidoPendentesLocal(PnrProduto,PcdEmpresa: Integer;
      stPedidos: String): boolean;
    procedure SetValoresCampos;
    function FiltraPorEspecealidade(nrSequencia: Integer): boolean;
    procedure Imprimir;
    procedure TopoPagina(nrPagina, nrLinha: Integer);
    procedure CabecalhoInicioPag(nrLaboratorio, nrLinha, nrDias, nrGrupo,
      nrLeadTime, nrPrazoPadrao: Integer;
      stNomeLaboratorio, stCurvaLaboratorio: String);
    procedure CabecalhoPag(nrLinha: Integer);
    procedure LinhaDetalhe(nrLinha, nrCodigo, nrUnidadeTrimistre, nrUnidadeMes3,
      nrUnidadeMes2, nrUnidadeMes1, nrUnidadeMes0, nrUnidadePendencia,
      nrUnidadeEstoque, nrUnidadeEmbalagem, nrEstoqueMaximo: Integer;
      nmProduto, nmApresentacao, nmUnidade, nmCurva, ds_pendencia: String;
      pcDesconto, vlPrecoUnitario: Double);
    procedure SomaRodapePag(nrLinha: Integer);
    procedure GravaPendenciaLocal;
    procedure GerarExcelSugestao(Consulta: TclientdataSet);
    procedure Exportar(DataSet: TDataSet; Arq, Ext: string);
    procedure executaSugestao(PnrComprador, PnrForncedor: Integer);
    procedure AbreSugestaoCompra(PnrFornecedor, PnrComprador, PnrDias,PnrCD: Integer);
    procedure CarregaEmpresa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmSugestaodeCompra: T_frmSugestaodeCompra;
  nrDias,NrCD, nrFornecedor,nrComprador, vlContaLinha, vlPag, vgLinha, Linha: Integer;
  nmMes0, nmMes1, nmMes2, nmMes3,
  nmCd: String;
  DaDosFornecedor: TDadosFornecedor;
  stPedidosPendentes:WideString;
implementation

{$R *.dfm}

procedure T_frmSugestaodeCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure T_frmSugestaodeCompra.FormCreate(Sender: TObject);
begin
  with _frmSugestaodeCompra do
  begin
    top := 0;
    Left := 0;
  end;
//  setGridSugestaoCompra;
end;

procedure T_frmSugestaodeCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    VK_RETURN:
      begin
        executaSugestao(0,0);
        if not(ActiveControl is TDBGrid) then
          Perform(WM_NEXTDLGCTL, 0, 0)
        else if (ActiveControl is TDBGrid) then
        begin
          with TDBGrid(ActiveControl) do
            if selectedindex < (fieldcount - 1) then
              selectedindex := selectedindex + 1
            else
              selectedindex := 0;
        end;
      end;
  end;

end;

procedure T_frmSugestaodeCompra.FormShow(Sender: TObject);
begin
  _edtNrDiasEstoque.SetFocus;
  nmMes0 := copy(NomedoMes(dtSistema), 1, 3) + '.';
  nmMes1 := copy(NomedoMes(IncMonth(dtSistema, -1)), 1, 3) + '.';
  nmMes2 := copy(NomedoMes(IncMonth(dtSistema, -2)), 1, 3) + '.';
  nmMes3 := copy(NomedoMes(IncMonth(dtSistema, -3)), 1, 3) + '.';
  _Mes0.Caption := 'Total Unid. ' + nmMes0;
  _Mes1.Caption := 'Total Unid. ' + nmMes1;
  _Mes2.Caption := 'Total Unid. ' + nmMes2;
  _Mes3.Caption := 'Total Unid. ' + nmMes3;
  _VlVendaMes0.Caption:='Valor Venda ' + nmMes0;
  _VlVendaMes1.Caption:='Valor Venda ' + nmMes1;
  _VlVendaMes2.Caption:='Valor Venda ' + nmMes2;
  _VlVendaMes3.Caption:='Valor Venda ' + nmMes3;
  _edtNrComprador.Text:=FormatFloat('0000',nrCompradorSistema);
  _btnParaExcel.Enabled:=false;
  _btnImprimir.Enabled:=false;
  CarregaEmpresa;
end;

procedure T_frmSugestaodeCompra._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
  case Key of
    VK_RETURN:
      begin
        _cdsSugestaoCompra.Close;
        Application.ProcessMessages;

        nrDias := StrToIntDef(_edtNrDiasEstoque.Text, 0);
        nrFornecedor := StrToIntDef(_edtNrFornecedor.Text, 0);
        nrComprador  := StrToIntDef(_edtNrComprador.Text, 0);
        NrCD:=0;
        nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

         nmCd:=_cbxOpcaoCDs.Items.Strings[_cbxOpcaoCDs.ItemIndex];
        _cdsPedidosPendentes.Close;
        _cdsPedidosPendentes.CreateDataSet;

        if nrFornecedor > 0 then
        begin
          //AbrePendencia(nrFornecedor);
          _cdsPendencia:=AbrePendenciaCompradorSugestao(nrFornecedor,nrComprador,NrCD);
          if _cdsPendencia<>NIL then
             _cdsPendencia.Open;
          ExecutaPesquisa(nrFornecedor,nrComprador,nrDias,NrCD);
          AbreEspecealidade(nrFornecedor);
        end;
      end;

  end;
end;

procedure T_frmSugestaodeCompra.ExecutaPesquisa(PnrFornecedor,PnrComprador, PnrDias,PnrCD: Integer);
begin
    nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);
    nmCd:=_cbxOpcaoCDs.Items.Strings[_cbxOpcaoCDs.ItemIndex];
   _btnParaExcel.Enabled:=true;
   _btnImprimir.Enabled:=true;
   Application.ProcessMessages;
    AbreSugestaoCompra(PnrFornecedor,PnrComprador,PnrDias,PnrCD);

   if _cdsSugestaoCompra.IsEmpty then
   begin
     _btnParaExcel.Enabled:=false;
     _btnImprimir.Enabled:=false;
   end;




   setGridSugestaoCompra;

  if not _cdsSugestaoCompra.IsEmpty then
    setDadosSugestao;
  SetValoresCampos;
  _cdsSugestaoCompra.First;
  exit;
end;

procedure T_frmSugestaodeCompra.filtraPendencia(PnrProduto,PnrCd: Integer);
begin
if _cdsPendencia<>nil then
begin

  with _cdsPendencia do
  begin
    filter := 'NROM_Y=' + IntToStr(PnrProduto);
    if pnrCD>0 then
      filter := 'NROM_Y=' + IntToStr(PnrProduto)+' and CD_EMPRESA='+IntToStr(PnrCd);
    Filtered := true;
  end;
  GravaPendenciaLocal;
end;
end;

procedure T_frmSugestaodeCompra.setDadosSugestao;
begin
  _cdsSugestaoCompra.First;
  _cdsSugestaoCompra.DisableControls;
  while not _cdsSugestaoCompra.Eof do
  begin
    filtraPendencia(_cdsSugestaoCompra.FieldByName('NROM_M').AsInteger,NRCD);
    //_cdsSugestaoCompra.FieldByName('CD_EMPRESA').AsInteger);
    _cdsSugestaoCompra.Next;
  end;
  _cdsSugestaoCompra.EnableControls;
  _cdsPedidosPendentes.IndexFieldNames := 'NR_PRODUTO';
  _cdsPedidosPendentes.MasterSource := _dsSugestaoCompra;
  _cdsPedidosPendentes.MasterFields := 'NROM_M';
  _cdsPedidosPendentes.OPEN;
  _cdsSugestaoCompra.IndexFieldNames := 'PRODUTO;APRESENTACAO';

end;

Procedure T_frmSugestaodeCompra.setGridSugestaoCompra;
begin
  TIntegerField(_cdsSugestaoCompra.FieldByName('CODIGO')).DisplayLabel:= 'Codigo';
  TIntegerField(_cdsSugestaoCompra.FieldByName('CODIGO')).DisplayWidth := 7;
  TIntegerField(_cdsSugestaoCompra.FieldByName('CODIGO')).SetFieldType(ftInteger);


  TStringField(_cdsSugestaoCompra.FieldByName('PRODUTO')).DisplayLabel :='_______Produto______';
  TStringField(_cdsSugestaoCompra.FieldByName('PRODUTO')).DisplayWidth := 20;

  TStringField(_cdsSugestaoCompra.FieldByName('APRESENTACAO')).DisplayLabel :=
    '____Apresenta??o____';
  TStringField(_cdsSugestaoCompra.FieldByName('APRESENTACAO'))
    .DisplayWidth := 20;

  TStringField(_cdsSugestaoCompra.FieldByName('UNID')).DisplayLabel := 'Un.';
  TStringField(_cdsSugestaoCompra.FieldByName('UNID')).DisplayWidth := 3;

  TFloatField(_cdsSugestaoCompra.FieldByName('UNITARIO')).DisplayLabel := 'P?o.Unit.';
  TFloatField(_cdsSugestaoCompra.FieldByName('UNITARIO')).DisplayFormat :='##,###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('UNITARIO')).DisplayWidth := 12;

  TFloatField(_cdsSugestaoCompra.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayLabel := '% Desc.Padr?o';
  TFloatField(_cdsSugestaoCompra.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayFormat :='##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayWidth := 12;


  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_VENDA')).DisplayLabel :=
    'Venda Trim.';
  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_VENDA')).DisplayWidth := 7;

  TIntegerField(_cdsSugestaoCompra.FieldByName('ESTQ')).DisplayLabel :=
    'Estoque';
  TIntegerField(_cdsSugestaoCompra.FieldByName('ESTQ')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('ESTQ')).DisplayWidth := 7;

  TIntegerField(_cdsSugestaoCompra.FieldByName('UNI_PENDENTE')).DisplayLabel :=
    'Unid.Pendentes';
  TIntegerField(_cdsSugestaoCompra.FieldByName('UNI_PENDENTE')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('UNI_PENDENTE'))
    .DisplayWidth := 7;

  TFloatField(_cdsSugestaoCompra.FieldByName('VTPENDENCIAFABRICA')).DisplayLabel
    := 'Unid.Pendentes';
  TFloatField(_cdsSugestaoCompra.FieldByName('VTPENDENCIAFABRICA'))
    .DisplayFormat := '###,###,##0';
  TFloatField(_cdsSugestaoCompra.FieldByName('VTPENDENCIAFABRICA'))
    .DisplayWidth := 7;
  TFloatField(_cdsSugestaoCompra.FieldByName('VTPENDENCIAFABRICA'))
    .Visible := FALSE;

  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA')).DisplayLabel :=
    'Sug.Compra';
  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA')).DisplayWidth := 7;

  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA_PEND')).DisplayLabel :=
    'Sug.Compra C/Pend.';
  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA_PEND')).DisplayFormat
    := '###,###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('SUG_CPRA_PEND'))
    .DisplayWidth := 7;

  TIntegerField(_cdsSugestaoCompra.FieldByName('EMB_COMPRA')).DisplayLabel
    := 'Emb.';
  TIntegerField(_cdsSugestaoCompra.FieldByName('EMB_COMPRA')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('EMB_COMPRA')).DisplayWidth := 6;

  TIntegerField(_cdsSugestaoCompra.FieldByName('MES3')).DisplayLabel := 'Mes_3';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES3')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES3')).DisplayWidth := 6;

  TIntegerField(_cdsSugestaoCompra.FieldByName('MES2')).DisplayLabel := 'Mes_2';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES2')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES2')).DisplayWidth := 6;

  TIntegerField(_cdsSugestaoCompra.FieldByName('MES1')).DisplayLabel := 'Mes_1';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES1')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES1')).DisplayWidth := 6;

  TIntegerField(_cdsSugestaoCompra.FieldByName('MES0')).DisplayLabel := 'Mes_0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES0')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('MES0')).DisplayWidth := 6;

//  TStringField(_cdsSugestaoCompra.FieldByName('CURVA')).DisplayLabel := 'Curva';
//  TStringField(_cdsSugestaoCompra.FieldByName('CURVA')).DisplayWidth := 5;

  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA')).DisplayLabel :=
    'M?dia Dia.';
  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA')).DisplayFormat :=
    '###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA')).DisplayWidth := 10;

  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA_MES')).DisplayLabel :=
    'M?dia Mes';
  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA_MES')).DisplayFormat :=
    '###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('MEDIA_MES')).DisplayWidth := 10;

  TIntegerField(_cdsSugestaoCompra.FieldByName('LEADTIME')).DisplayLabel :=
    'Lead Time';
  TIntegerField(_cdsSugestaoCompra.FieldByName('LEADTIME')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('LEADTIME')).DisplayWidth := 6;

  TIntegerField(_cdsSugestaoCompra.FieldByName('DIAS_SEM_ESTOQUE')).DisplayLabel
    := 'Dias S/Estoque';
  TIntegerField(_cdsSugestaoCompra.FieldByName('DIAS_SEM_ESTOQUE'))
    .DisplayFormat := '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('DIAS_SEM_ESTOQUE'))
    .DisplayWidth := 6;

{  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_ESTOQUE_MAXIMO'))
    .DisplayLabel := 'ESTQ. MAX(dd)';
  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_ESTOQUE_MAXIMO'))
    .DisplayFormat := '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_ESTOQUE_MAXIMO'))
    .DisplayWidth := 6;}

  TIntegerField(_cdsSugestaoCompra.FieldByName('GRUPO')).DisplayLabel
    := 'Grupo';
  TIntegerField(_cdsSugestaoCompra.FieldByName('GRUPO')).DisplayFormat :=
    '###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('GRUPO')).DisplayWidth := 6;

end;

Procedure T_frmSugestaodeCompra.AbreEspecealidade(nrFornecedor: Integer);
begin
  with _cdsEspecealidade do
  begin
    Close;
    Params.ParamByName('PnrLaboratorio').AsInteger := nrFornecedor;
    OPEN;
  end;
end;

Procedure T_frmSugestaodeCompra.AbrePendencia(nrFornecedor: Integer);
var
  nrLinhas: Integer;
  stPedido: WideString;
begin
  with _cdsPendencia do
  begin
    Close;
    Filtered := FALSE;
    Params.ParamByName('PNR_LABORATORIO').AsInteger := nrFornecedor;
    OPEN;
    First;
  end;

end;

procedure T_frmSugestaodeCompra.BitBtn1Click(Sender: TObject);
begin
//  Exportar(_cdsSugestaoCompra,'teste','html');
end;

procedure T_frmSugestaodeCompra.GravaPendenciaLocal;
var
  nrLinhas: Integer;
  stPedido: WideString;

begin
  stPedido := '';
  if _cdsPendencia.Active then
  begin
   if (not _cdsPendencia.IsEmpty) then
   begin
    while not _cdsPendencia.Eof do
    begin
      Inc(nrLinhas);
      if nrLinhas > 3 then
      begin
        stPedido := stPedido + 'Nr. Pedido : ' + FormatFloat('000000',
          _cdsPendencia.FieldByName('NROP_P').AsInteger) + ' - ' +
          FormatDateTime('dd/mm/yy', _cdsPendencia.FieldByName('DATP_P')
          .AsDateTime) + '  ' + FormatFloat('###,###,##0',
          _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger) + ' ' +
          _cdsPendencia.FieldByName('SITY_Y').AsString;
        GravaPedidoPendentesLocal(_cdsPendencia.FieldByName('NROM_Y').AsInteger,
        _cdsPendencia.FieldByName('CD_EMPRESA').AsInteger,stPedido);
        stPedido:='';
        nrLinhas := 0;
      end;
      if trim(stPedido) <> '' then
        stPedido := stPedido + '   ';
      stPedido := stPedido + 'Nr. Pedido : ' + FormatFloat('000000',
        _cdsPendencia.FieldByName('NROP_P').AsInteger) + ' - ' +
        FormatDateTime('dd/mm/yy', _cdsPendencia.FieldByName('DATP_P')
        .AsDateTime) + '  ' + FormatFloat('###,###,##0',
        _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger) + ' ' +
        _cdsPendencia.FieldByName('SITY_Y').AsString;
      _cdsPendencia.Next;
    end;
    GravaPedidoPendentesLocal(_cdsPendencia.FieldByName('NROM_Y').AsInteger,
    _cdsPendencia.FieldByName('CD_EMPRESA').AsInteger,stPedido);
  end;
 end;

end;

procedure T_frmSugestaodeCompra._btnImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure T_frmSugestaodeCompra.DBGrid2DblClick(Sender: TObject);
begin
  FiltraPorEspecealidade(_cdsEspecealidade.FieldByName('NR_SEQUENCIAL')
    .AsInteger);
  SetValoresCampos;

end;

procedure T_frmSugestaodeCompra.DBGrid2TitleClick(Column: TColumn);
begin
  _cdsSugestaoCompra.Filtered := FALSE;
  SetValoresCampos;
end;

procedure T_frmSugestaodeCompra._btnParaExcelClick(Sender: TObject);
begin
  if not _cdsSugestaoCompra.IsEmpty then
//    GerarExcelLocal(_cdsSugestaoCompra);
    DaDosFornecedor := GetDadosLaboratorio(nrFornecedor);

  GerarExcelSugestao(_cdsSugestaoCompra);

end;

procedure T_frmSugestaodeCompra._cbxOpcaoCDsEnter(Sender: TObject);
begin
   //_btnParaExcel.Enabled:=false;
   //_btnImprimir.Enabled:=false;

end;

procedure T_frmSugestaodeCompra._dbgSugestaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Cor: TColor;
begin
  If odd(_cdsSugestaoCompra.RecNo) then
  begin
    _dbgSugestao.Canvas.Font.Color := clblack;
    _dbgSugestao.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgSugestao.Canvas.Font.Color := clblack;
    _dbgSugestao.Canvas.Brush.Color := clWhite;
  end;
  // DBGrid1.Canvas.FillRect(Rect);
  // DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
  if (Column.field.fieldName = 'UNI_PENDENTE') then
  begin
    if _cdsSugestaoCompra.FieldByName('UNI_PENDENTE').AsInteger > 0 then
    begin
      _dbgSugestao.Font.Color := clWhite;
      _dbgSugestao.Canvas.Brush.Color := clYellow;
      _dbgSugestao.Canvas.FillRect(Rect);
      _dbgSugestao.DefaultDrawDataCell(Rect, _dbgSugestao.columns[DataCol]
        .field, State);
    end;
  end;

  if ((TAuxDBGrid(_dbgSugestao).DataLink.ActiveRecord +
    1 = TAuxDBGrid(_dbgSugestao).Row) or (gdSelected in State)) then
  begin
    _dbgSugestao.Canvas.Brush.Color := clblue;
    _dbgSugestao.Canvas.Font.Style := _dbgSugestao.Canvas.Font.Style + [fsBold];
    _dbgSugestao.Canvas.Font.Color := clWhite;
  end;
  if gdFocused in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Cor := clRed;
      Brush.Color := Cor;
      FillRect(Rect);
      _dbgSugestao.DefaultDrawDataCell(Rect, _dbgSugestao.columns[DataCol]
        .field, State);
    end;

  _dbgSugestao.Canvas.FillRect(Rect);
  _dbgSugestao.DefaultDrawDataCell(Rect, _dbgSugestao.columns[DataCol]
    .field, State);

end;

procedure T_frmSugestaodeCompra._dbgSugestaoTitleClick(Column: TColumn);
VAR
 idColuna:string;
begin
  idColuna:=Column.FieldName;
  if idColuna='PRODUTO' then
      _cdsSugestaoCompra.IndexFieldNames:='PRODUTO;APRESENTACAO';
  if idColuna='APRESENTACAO' then
      _cdsSugestaoCompra.IndexFieldNames:='APRESENTACAO;PRODUTO';

  if (idColuna<>'APRESENTACAO') and (idColuna<>'PRODUTO') then
      GeraOrdenacao(_cdsSugestaoCompra,Column);

end;

function T_frmSugestaodeCompra.GravaPedidoPendentesLocal(PnrProduto,PcdEmpresa: Integer;
  stPedidos: String): boolean;
begin
  _cdsPedidosPendentes.OPEN;
  _cdsPedidosPendentes.Append;
  _cdsPedidosPendentesNR_PRODUTO.AsInteger := pnrProduto;
  _cdsPedidosPendentesCD_EMPRESA.AsInteger := PcdEmpresa;
  _cdsPedidosPendentesDS_PEDIDO.AsString := stPedidos;
  _cdsPedidosPendentes.Post;
end;

procedure T_frmSugestaodeCompra.SetValoresCampos;
begin
  if _cdsSugestaoCompraSomaVdaTrimestre.AsVariant<>NULL then
    _edtTotalUnidTrimestre.Text := FormatFloat('###,###,##0',_cdsSugestaoCompraSomaVdaTrimestre.AsVariant);
  if _cdsSugestaoCompraSomaMes0.AsVariant<>NULL then
    _edtTotalUnidMes0.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaMes0.AsVariant);
  if _cdsSugestaoCompraSomaMes1.AsVariant<>NULL then
  _edtTotalUnidMes1.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaMes1.AsVariant);
  if  _cdsSugestaoCompraSomaMes2.AsVariant<>NULL then
    _edtTotalUnidMes2.Text := FormatFloat('###,###,##0',_cdsSugestaoCompraSomaMes2.AsVariant);
  if _cdsSugestaoCompraSomaMes3.AsVariant<>NULl then
  _edtTotalUnidMes3.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaMes3.AsVariant);
  //
  if  _cdsSugestaoCompraSomaVlMes0.AsVariant<>NULL then
      _edtVlVendaMes0.Text := FormatFloat('###,###,##0.00',_cdsSugestaoCompraSomaVlMes0.AsVariant);
  if _cdsSugestaoCompraSomaVlMes1.AsVariant<>null then
     _edtVlVendaMes1.Text := FormatFloat('###,###,##0.00',_cdsSugestaoCompraSomaVlMes1.AsVariant);
  if _cdsSugestaoCompraSomaVlMes2.AsVariant<>null then
    _edtVlVendaMes2.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaVlMes2.AsVariant);
  if _cdsSugestaoCompraSomaVlMes3.AsVariant<>null then
    _edtVlVendaMes3.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaVlMes3.AsVariant);

  if _cdsSugestaoCompraSomaVlrEstoque.AsVariant<>null then
    _edtVlEstoque.Text := FormatFloat('###,###,##0.00',_cdsSugestaoCompraSomaVlrEstoque.AsVariant);
  //
  if _cdsSugestaoCompraSomaUnidadePendentes.AsVariant<>null then
    _edtTotalUnPendentes.Text := FormatFloat('###,###,##0.00',_cdsSugestaoCompraSomaUnidadePendentes.AsVariant);
  if _cdsSugestaoCompraSomaValorPendenciaCusto.AsVariant<>null then
    _edtValorTotalPendentesCusto.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaValorPendenciaCusto.AsVariant);
  if _cdsSugestaoCompraSomaValorPendenciaFabrica.AsVariant<>null then
    _edtValorTotalPendentesFabr.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaValorPendenciaFabrica.AsVariant);

  //
  if  _cdsSugestaoCompraSomaSugestaoCompraSPendencia.AsVariant<>null then
   _edtTotalUniSugerida.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaSugestaoCompraSPendencia.AsVariant);

  if _cdsSugestaoCompraSomaValorSugCompraSPendencia.AsVariant<>null then
   _edtValorTotalUniSugerida.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaValorSugCompraSPendencia.AsVariant);

   if _cdsSugestaoCompraSomaSugestaoCompraCPendencia.AsVariant<>null then
    _edtTotalUniSugeridaCPendencia.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaSugestaoCompraCPendencia.AsVariant);
  if _cdsSugestaoCompraSomaValorSugCompraCPendencia.AsVariant<>null then
   _edtValorTotalUniSugeridaCPendencia.Text := FormatFloat('###,###,##0.00',
    _cdsSugestaoCompraSomaValorSugCompraCPendencia.AsVariant);
  //
  if _cdsSugestaoCompraSomaUnidadePendentes.AsVariant<>null then
    _edtTotalUnPendentes.Text := FormatFloat('###,###,##0', _cdsSugestaoCompraSomaUnidadePendentes.AsVariant);
  if _cdsSugestaoCompraSomaValorPendenciaCusto.AsVariant<>null then
   _edtValorTotalPendentesCusto.Text := FormatFloat('###,###,##0.00',  _cdsSugestaoCompraSomaValorPendenciaCusto.AsVariant);

  if _cdsSugestaoCompraSomaValorPendenciaFabrica.AsVariant<>null then
    _edtValorTotalPendentesFabr.Text := FormatFloat('###,###,##0.00', _cdsSugestaoCompraSomaValorPendenciaFabrica.AsVariant);

end;

FUNCTION T_frmSugestaodeCompra.FiltraPorEspecealidade(nrSequencia: Integer): boolean;
BEGIN
  WITH _cdsSugestaoCompra DO
  BEGIN
    filter := 'EITM_M=' + IntToStr(nrSequencia) + ' OR ERGM_M=' +
      IntToStr(nrSequencia);
    Filtered := true;
  END;
END;

procedure T_frmSugestaodeCompra.Imprimir;
var
  i: Integer;
  loDir,
  loPastaLocal, loNomeArquivo: String;
  LoCodigo, loProduto, loApresentacao, LoUn, loPcDesconto, loVendaTrimestre,
    loVendaMes3, loVendaMes2, loVendaMes1, loVendaMes0, loPendencia, loPreco,
    loEstoque, loEmbalagem, loCurva: String;
  nrPendencia: Integer;

begin
  with Printer do
  begin
   try
    vlContaLinha := 0;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 08;
    vlPag := 1;
    Linha := 200;
    Title := 'Sugest?o Compra p/ '+nmCd;
    Orientation := poLandScape;
    BeginDoc;
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    TopoPagina(vlPag, Linha);
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    DaDosFornecedor := GetDadosLaboratorio(nrFornecedor);
    CabecalhoInicioPag(DaDosFornecedor.nrFornecedor, Linha, nrDias,
      DaDosFornecedor.nrGrupoFornecedor, DaDosFornecedor.nrDiasLeadTime,
      DaDosFornecedor.nrPrazoPedido, DaDosFornecedor.dsNomeFantasia, '');
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    CabecalhoPag(vgLinha);
    _cdsSugestaoCompra.First;
    while not _cdsSugestaoCompra.Eof DO
    begin
      loPendencia := '';
      if not _cdsPedidosPendentes.IsEmpty then
        loPendencia := _cdsPedidosPendentesDS_PEDIDO.AsString;
        nrPendencia := _cdsSugestaoCompra.FieldByName('UNI_PENDENTE').AsInteger;

      LinhaDetalhe(vgLinha, _cdsSugestaoCompra.FieldByName('CODIGO').AsInteger,
        _cdsSugestaoCompra.FieldByName('QT_VENDA').AsInteger,
        _cdsSugestaoCompra.FieldByName('MES3').AsInteger,
        _cdsSugestaoCompra.FieldByName('MES2').AsInteger,
        _cdsSugestaoCompra.FieldByName('MES1').AsInteger,
        _cdsSugestaoCompra.FieldByName('MES0').AsInteger, nrPendencia,
        _cdsSugestaoCompra.FieldByName('ESTQ').AsInteger,
        _cdsSugestaoCompra.FieldByName('EMB_COMPRA').AsInteger,
        0,
        _cdsSugestaoCompra.FieldByName('PRODUTO').AsString,
        _cdsSugestaoCompra.FieldByName('APRESENTACAO').AsString,
        _cdsSugestaoCompra.FieldByName('UNID').AsString,
       '.',
        loPendencia, _cdsSugestaoCompra.FieldByName('PC_DESCONTO_PADRAO_COMPRA').Asfloat,
        _cdsSugestaoCompra.FieldByName('UNITARIO').Asfloat);
      _cdsSugestaoCompra.Next;
    end;
    SomaRodapePag(vgLinha);
    EndDoc;
  except
    EndDoc;
  end;
  end;
end;

procedure T_frmSugestaodeCompra.TopoPagina(nrPagina, nrLinha: Integer);
begin
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'Gen?sio A. Mendes & Cia Ltda');
  Printer.Canvas.TextOut(2800, nrLinha, 'Sugest?o Compra p/'+nmCd);
  Printer.Canvas.TextOut(4500, nrLinha,
    'Data :  ' + FormatDateTime('dd/mm/yyyy', Date));
  Printer.Canvas.TextOut(5500, nrLinha, 'Pagina: ' + FormatFloat('##0',
    nrPagina));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ************************ *)
procedure T_frmSugestaodeCompra.CabecalhoInicioPag(nrLaboratorio, nrLinha,
  nrDias, nrGrupo, nrLeadTime, nrPrazoPadrao: Integer;
  stNomeLaboratorio, stCurvaLaboratorio: String);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'Laborat?rio :' + FormatFloat('##0',
    nrLaboratorio));
  Printer.Canvas.TextOut(0900, nrLinha, stNomeLaboratorio);
  Printer.Canvas.TextOut(2200, nrLinha, stCurvaLaboratorio);
  Printer.Canvas.TextOut(2500, nrLinha, 'Sugest?o de Compra para  ' +
    FormatFloat('##0', nrDias));
  Printer.Canvas.TextOut(3950, nrLinha, 'Grupo : ' + FormatFloat('##0',
    nrGrupo));
  Printer.Canvas.TextOut(4500, nrLinha, 'LeadTime : ' + FormatFloat('##0',
    nrLeadTime));
  Printer.Canvas.TextOut(5500, nrLinha, 'Prazo Padr?o : ' + FormatFloat('##0',
    nrPrazoPadrao));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ************************ *)
procedure T_frmSugestaodeCompra.CabecalhoPag(nrLinha: Integer);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'C?digo');
  Printer.Canvas.TextOut(0400, nrLinha, 'Produto');
  Printer.Canvas.TextOut(1200, nrLinha, 'Apresenta??o');
  Printer.Canvas.TextOut(2150, nrLinha, 'UN');
  Printer.Canvas.TextOut(2350, nrLinha, '%.D');
  Printer.Canvas.TextOut(2650, nrLinha, 'P?o Unt.');
  Printer.Canvas.TextOut(3250, nrLinha, 'Trim');
  Printer.Canvas.TextOut(3650, nrLinha, nmMes3);
  Printer.Canvas.TextOut(4050, nrLinha, nmMes2);
  Printer.Canvas.TextOut(4450, nrLinha, nmMes1);
  Printer.Canvas.TextOut(4850, nrLinha, nmMes0);
  Printer.Canvas.TextOut(5250, nrLinha, 'Pend');
  Printer.Canvas.TextOut(5550, nrLinha, 'Estq');
  Printer.Canvas.TextOut(5950, nrLinha, 'Emb');
  Printer.Canvas.TextOut(6150, nrLinha, 'Curva');
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ****************************************************** *)
procedure T_frmSugestaodeCompra.SomaRodapePag(nrLinha: Integer);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0400, nrLinha, 'Totais :');
  Printer.Canvas.TextOut(3150, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaVdaTrimestre.AsVariant)));
  Printer.Canvas.TextOut(3550, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaMes3.AsVariant)));

  Printer.Canvas.TextOut(3950, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaMes2.AsVariant)));
  Printer.Canvas.TextOut(4350, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaMes1.AsVariant)));
  Printer.Canvas.TextOut(4750, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaMes0.AsVariant)));
  Printer.Canvas.TextOut(5150, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0',
    _cdsSugestaoCompraSomaUnidadePendentes.AsVariant)));
  Printer.Canvas.TextOut(5500, nrLinha, formataNumero(06, FormatFloat('###,##0',
    _cdsSugestaoCompraSomaUnidadeEstoque.AsVariant)));
  Inc(vlContaLinha);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate(' ', 199));
  Printer.Canvas.TextOut(0400, nrLinha, 'Venda R$.');
  Printer.Canvas.TextOut(1000, nrLinha, nmMes3 + ':');
  Printer.Canvas.TextOut(1400, nrLinha,
    formataNumero(11, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaVlMes3.AsVariant)));

  Printer.Canvas.TextOut(2029, nrLinha, nmMes2);
  Printer.Canvas.TextOut(2429, nrLinha,
    formataNumero(11, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaVlMes2.AsVariant)));

  Printer.Canvas.TextOut(3058, nrLinha, nmMes1);
  Printer.Canvas.TextOut(3458, nrLinha,
    formataNumero(11, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaVlMes1.AsVariant)));

  Printer.Canvas.TextOut(4087, nrLinha, nmMes0);
  Printer.Canvas.TextOut(4487, nrLinha,
    formataNumero(11, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaVlMes0.AsVariant)));

  Inc(vlContaLinha);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate(' ', 199));

  Printer.Canvas.TextOut(0400, nrLinha, 'Totais R$.');
  Printer.Canvas.TextOut(1000, nrLinha, 'Estoque (P?o. Venda):');
  Printer.Canvas.TextOut(1800, nrLinha,
    formataNumero(17, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaVlrEstoque.AsVariant)));

  Printer.Canvas.TextOut(2800, nrLinha, 'Compra. Sug.s/Pend.: ');
  Printer.Canvas.TextOut(3700, nrLinha,
    formataNumero(17, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaValorSugCompraSPendencia.AsVariant)));
  Printer.Canvas.TextOut(4700, nrLinha, 'Compra. Sug.C/Pend.: ');
  Printer.Canvas.TextOut(5500, nrLinha,
    formataNumero(17, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaValorSugCompraCPendencia.AsVariant)));

  Inc(vlContaLinha);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate(' ', 199));

  Printer.Canvas.TextOut(1000, nrLinha, 'Pendencia P?o Venda :');
  Printer.Canvas.TextOut(1800, nrLinha,
    formataNumero(17, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaValorPendenciaFabrica.AsVariant)));

  Printer.Canvas.TextOut(2800, nrLinha, 'Pendencia P?o Custo :');
  Printer.Canvas.TextOut(3700, nrLinha,
    formataNumero(17, FormatFloat('##,###,###,##0.00',
    _cdsSugestaoCompraSomaValorPendenciaCusto.AsVariant)));

  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;
(* ****************************************************** *)
(* ****************************************************** *)

procedure T_frmSugestaodeCompra.LinhaDetalhe(nrLinha, nrCodigo,
  nrUnidadeTrimistre, nrUnidadeMes3, nrUnidadeMes2, nrUnidadeMes1,
  nrUnidadeMes0, nrUnidadePendencia, nrUnidadeEstoque, nrUnidadeEmbalagem,
  nrEstoqueMaximo: Integer; nmProduto, nmApresentacao, nmUnidade, nmCurva,
  ds_pendencia: String; pcDesconto, vlPrecoUnitario: Double);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha,
    formataNumero(07, FormatFloat('######/#', nrCodigo)));
  Printer.Canvas.TextOut(0400, nrLinha, FormataString(nmProduto, 15));
  Printer.Canvas.TextOut(1200, nrLinha, FormataString(nmApresentacao, 15));
  Printer.Canvas.TextOut(2150, nrLinha, FormataString(nmUnidade, 2));
  Printer.Canvas.TextOut(2250, nrLinha, formataNumero(06, FormatFloat('##0.00',
    pcDesconto)));
  Printer.Canvas.TextOut(2600, nrLinha,
    formataNumero(09, FormatFloat('##,##0.00', vlPrecoUnitario)));
  if nrUnidadeTrimistre < 9999999 then
    Printer.Canvas.TextOut(3150, nrLinha,
      formataNumero(07, FormatFloat('#,###,##0', nrUnidadeTrimistre)))
  else
    Printer.Canvas.TextOut(3150, nrLinha, formataNumero(07, 'Nr.>9999999'));
  if nrUnidadeMes3 < 9999999 then
    Printer.Canvas.TextOut(3550, nrLinha,
      formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes3)))
  else
    Printer.Canvas.TextOut(3550, nrLinha, formataNumero(07, 'Nr.>9999999'));

  Printer.Canvas.TextOut(3950, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes2)));
  Printer.Canvas.TextOut(4350, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes1)));
  Printer.Canvas.TextOut(4750, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes0)));
  Printer.Canvas.TextOut(5150, nrLinha,
    formataNumero(07, FormatFloat('#,###,##0', nrUnidadePendencia)));
  Printer.Canvas.TextOut(5500, nrLinha, formataNumero(06, FormatFloat('###,##0',
    nrUnidadeEstoque)));
  if nrUnidadeEmbalagem < 99999 then
    Printer.Canvas.TextOut(5900, nrLinha,
      formataNumero(05, FormatFloat('####0', nrUnidadeEmbalagem)))
  else
    Printer.Canvas.TextOut(5900, nrLinha, formataNumero(05, 'Nr.>99999'));

  Printer.Canvas.TextOut(6150, nrLinha, nmCurva + ' - ' + FormatFloat('#0',
    nrEstoqueMaximo));
  if (trim(ds_pendencia) <> '') and (not _chkPendencia.Checked) then
  begin
    while not _cdsPedidosPendentes.Eof do
    begin
      Inc(vlContaLinha);
      ds_pendencia := _cdsPedidosPendentesDS_PEDIDO.AsString;
      nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
      Printer.Canvas.TextOut(00500, nrLinha, ds_pendencia);
      _cdsPedidosPendentes.Next;
    end;
  end;
  vgLinha := nrLinha;
  if vlContaLinha > 55 then
  begin
    Printer.NewPage;
    vlContaLinha := 0;
    Linha := 200;
    Inc(vlPag);
    TopoPagina(vlPag, Linha);
    CabecalhoPag(vgLinha);
  end;
end;




Procedure T_frmSugestaodeCompra.GerarExcelSugestao(Consulta:TclientdataSet);
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
     nrLinaInicial:=9;
     Consulta.First;
     try

        Consulta.EnableControls;

        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        excel.cells[02,01]:='Sugest?o Compra p/'+nmCd;
        // Alterado conforme SS.: 11563 em 25/09/2015 (Vete)
        //excel.cells[03,01]:='Laborat?rio :' + FormatFloat('00000', nrFornecedor) + ' - ' + DaDosFornecedor.dsNomeFantasia;
        excel.cells[03,01]:='Laborat?rio :' + FormatFloat('00000', nrFornecedor) + ' - ' + DaDosFornecedor.dsGrupoFornecedor;
        excel.cells[04,01]:='Sugest?o de Compra para  '+FormatFloat('##0',nrDias);
        excel.cells[05,01]:='Grupo : '+FormatFloat('##0',DaDosFornecedor.nrGrupoFornecedor);
        excel.cells[06,01]:='LeadTime : '+FormatFloat('##0',DaDosFornecedor.nrDiasLeadTime);
        excel.cells[07,01]:='Prazo Padr?o : '+FormatFloat('##0',DaDosFornecedor.nrPrazoPedido);
        excel.cells[08,01]:='Data : '+FormatDateTime('dd/mm/yyyy',dtSistema);

        excel.cells[09,01]:=Consulta.Fields[00].DisplayLabel; //Codigo01
        excel.cells[09,02]:=Consulta.Fields[01].DisplayLabel; //Produto02
        excel.cells[09,03]:=Consulta.Fields[02].DisplayLabel; //Apresentacao   03
        excel.cells[09,04]:=Consulta.Fields[03].DisplayLabel; //Unidade       04
        excel.cells[09,05]:=Consulta.Fields[12].DisplayLabel;  //Embalagem    05

        excel.cells[09,06]:=Consulta.Fields[29].DisplayLabel; // % Desc. Padrao  06
        excel.cells[09,07]:=Consulta.Fields[04].DisplayLabel; // Pre?o Unit.   07
        excel.cells[09,08]:=Consulta.Fields[05].DisplayLabel; //Venda Trime
//        excel.cells[09,09]:=Consulta.Fields[11].DisplayLabel; //09
        excel.cells[09,09]:=Consulta.Fields[13].DisplayLabel; //Mes_03 10
        excel.cells[09,10]:=Consulta.Fields[14].DisplayLabel; //Mes_02 11
        excel.cells[09,11]:=Consulta.Fields[15].DisplayLabel; //Mes_01 12
        excel.cells[09,12]:=Consulta.Fields[16].DisplayLabel; //Mes_00 12
        excel.cells[09,13]:=Consulta.Fields[08].DisplayLabel; // unidade Pendentes
       // excel.cells[09,14]:=Consulta.Fields[06].DisplayLabel; // Estoque 13
        excel.cells[09,15]:=Consulta.Fields[16].DisplayLabel; //15
        excel.cells[09,16]:='Pedido(s) Pendentes';
        linha:=9;
        coluna:=1;
        Consulta.First;
         while not Consulta.Eof do
         begin
          stPedidosPendentes := '';
          if not _cdsPedidosPendentes.IsEmpty then
                  stPedidosPendentes := _cdsPedidosPendentesDS_PEDIDO.AsString;

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=Consulta.FieldByName('CODIGO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=Consulta.FieldByName('PRODUTO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=Consulta.FieldByName('APRESENTACAO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=Consulta.FieldByName('UNID').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=Consulta.FieldByName('EMB_COMPRA').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=Consulta.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=Consulta.FieldByName('UNITARIO').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=Consulta.FieldByName('QT_VENDA').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=Consulta.FieldByName('MES3').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,10]:=Consulta.FieldByName('MES2').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,11]:=Consulta.FieldByName('MES1').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=Consulta.FieldByName('MES0').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=Consulta.FieldByName('UNI_PENDENTE').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=Consulta.FieldByName('ESTQ').AsInteger;
          // Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=Consulta.FieldByName('CURVA').AsString+' - '+FormatFloat('00',Consulta.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger);
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=stPedidosPendentes;
           inc(linha);
           Inc(coluna);
           Consulta.Next;
         end;

       // end;
        excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     //excel.quit;
end;

procedure T_frmSugestaodeCompra.Exportar(DataSet: TDataSet; Arq: string; Ext: string);
var
  shtml     : widestring;
  htmlfile  : TextFile;
  i         : integer;
  AvailableFields: set of  TFieldType;
  bookmark : TBookmark;
begin
  bookmark := dataset.Bookmark;
  DataSet.DisableControls;
  DataSet.First;
  AvailableFields:=[ftInteger, ftWideString, ftDate,  ftBcd,ftFMTBcd,ftmemo, ftstring];
// --> cria o c?digo html da p?gina
  shtml:= '<html> <head>'+#13#10;
  shtml:= shtml + '<title>'+'Sugest?o de Compras'+'</title></head>' + #13#10;
  shtml:= shtml + '<body>' + #13#10;
  shtml:= shtml + '<script>'+#13+'function cor_tabela(id){'+#13+
                  'var cor1="#dae5e3";'+#13+
                  'var cor2="#fff";'+#13+
                  'var x=document.getElementById(id).getElementsByTagName("tr");'+#13+
                  'for(i=0;i<x.length;i++)'+#13+
                  'x[i].style.backgroundColor=(i%2==0)?cor1:cor2;'+#13+
                  '}'+#13+
                  '</script>'+#13+#10;
  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border:solid 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;
  //header da tabela
  shtml:= shtml + '<table id="tb" cellspacing="1" width="100%">' + #13#10;
  shtml:= shtml + '<tr>' + #13#10;
  for i:=0 to DataSet.FieldCount-1 do
  begin
    if DataSet.Fields[i].DataType in AvailableFields  then
    begin
      shtml:= shtml + '<th>';
      shtml:= shtml +
              '' +
              DataSet.Fields.Fields[i].DisplayName +
              '';
      shtml:= shtml + '</th>' + #13#10;
    end;
  end;{for}
  shtml:= shtml + '</tr>' + #13#10;

  //corpo da tabela
  while not DataSet.Eof do
  begin
    shtml:= shtml + '<tr>' + #13#10;
    for i:=0 to DataSet.FieldCount-1 do
    begin
      if DataSet.Fields.Fields[i].DataType in AvailableFields then
      begin
        if  ((i= 0) OR (i= 5) OR (i= 6) OR (i= 7) OR (i= 8)OR (i= 9)OR (i= 10)
             OR (i= 11)OR (i= 12)OR (i= 13)OR (i= 14) OR (i= 16)OR (i= 17) OR (i= 18)
             OR (i= 19)OR (i= 20) OR (i= 22) OR (i= 23)OR (i= 26) OR (i= 27)OR (i= 28) AND (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
          shtml:= shtml + '<td align="right">'+ formatfloat('#####0', DataSet.Fields.Fields[i].AsFloat);
        if ((i<>0) AND (i<> 5)AND (i<>6) AND (i<> 7) AND (i<> 8)AND (i<> 9)AND (i<> 10)
             AND (i<> 11)AND (i<> 12)AND (i<> 13)AND (i<> 14)AND (i<> 16)
             AND (i<> 17)AND (i<> 18)AND (i<> 19)AND (i<> 20)AND (i<> 22)AND (i<> 23)
             AND (i<> 26) AND (i<> 27) AND (i<> 28)AND (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
          shtml:= shtml + '<td align="right">'+ formatfloat('###,##0.00', DataSet.Fields.Fields[i].AsFloat);
        if (DataSet.Fields.Fields[i].DataType = ftInteger) or
            (DataSet.Fields.Fields[i].DataType = ftBcd)  then
        begin
          shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsInteger);

        end;
        if (DataSet.Fields.Fields[i].DataType <> ftBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftFmtBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftInteger) then
        begin
          shtml:= shtml + '<td>'+DataSet.Fields.Fields[i].AsString;
          shtml:= shtml + '</td>' + #13#10;
        end;
      end;
    end;{for}
    shtml:= shtml + '</tr>' + #13#10;
    DataSet.Next;
  end;{while}
  shtml:= shtml + '</table>' + #13#10;
  //script para zebrar a tabela
  shtml:= shtml + '<script>cor_tabela("tb");</script>'+#13+#10;
  //finalizando a p?gina
  shtml:= shtml + '</body></html>';
// --> salva o arquivo html
  AssignFile(htmlfile,ChangeFileExt(Arq,'.'+Ext));
  Rewrite(htmlfile);
  WriteLn(htmlfile, shtml);
  CloseFile(htmlfile);
  DataSet.Bookmark := bookmark;
  DataSet.EnableControls;
end;

procedure T_frmSugestaodeCompra.executaSugestao(PnrComprador,PnrForncedor:Integer);
begin
        nrDias := StrToIntDef(_edtNrDiasEstoque.Text, 0);
        nrFornecedor := StrToIntDef(_edtNrFornecedor.Text, 0);
        nrComprador  := StrToIntDef(_edtNrComprador.Text, 0);
        NrCD:=0;
        nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);


        _cdsPedidosPendentes.Close;
        _cdsPedidosPendentes.CreateDataSet;

        if nrFornecedor > 0 then
        begin
//          AbrePendencia(nrFornecedor);
          _cdsPendencia:=AbrePendenciaCompradorSugestao(nrFornecedor,nrComprador,NrCD);
          if _cdsPendencia<>NIL then
             _cdsPendencia.Open;
          ExecutaPesquisa(nrFornecedor,nrComprador,nrDias,NrCD);

          AbreEspecealidade(nrFornecedor);
        end;

end;



procedure T_frmSugestaodeCompra.AbreSugestaoCompra(PnrFornecedor,PnrComprador,PnrDias,PnrCD: Integer);
var
 stQry :TStringList;
begin

stQry:=TStringList.Create;
 with stQry do
 begin
   Add('SELECT');
   Add('CODIGO,');
   Add('PRODUTO,');
   Add('APRESENTACAO,');
   Add('UNID,');
   Add('MAX(UNITARIO) AS UNITARIO,');
   Add('SUM(QT_VENDA) AS QT_VENDA,');
   Add('SUM(ESTQ) AS ESTQ,');
   Add('SUM(UNI_PENDENTE) AS UNI_PENDENTE,');
   Add('SUM(VTPENDENCIAFABRICA) AS VTPENDENCIAFABRICA,');
   Add('SUM(VTPENDENCIACUSTO) AS VTPENDENCIACUSTO,');

   Add('sum(SUG_CPRA) as SUG_CPRA,');
   Add('sum(SUG_CPRA_PEND)  as SUG_CPRA_PEND,');
   Add('EMB_COMPRA,');
   Add('SUM(NVL(MES3,0)) AS MES3,');
   Add('SUM(NVL(MES2,0)) AS MES2,');
   Add('SUM(NVL(MES1,0)) AS MES1,');
   Add('SUM(NVL(MES0,0)) AS MES0,');
//   Add('min(CURVA) as CURVA,');
   Add('GRUPO,');
   //Add('QT_ESTOQUE_MAXIMO ,');
   Add('LEADTIME ,');
   Add('MAX(NVL(DIAS_SEM_ESTOQUE,0)) AS DIAS_SEM_ESTOQUE,');
   Add('NVL(NR_DIAS,0) AS NR_DIAS,');
   Add('MAX(NVL(NR_DIAS_DIV,0)) AS NR_DIAS_DIV,');
   Add('SUM(NVL(MEDIA,0)) AS MEDIA,');
   Add('SUM(NVL((MEDIA* 30),0)) AS MEDIA_MES,');
   Add('MAX(NVL(DIAS_ESTOQUE_ZERO,0)) AS DIAS_ESTOQUE_ZERO,');
   Add('EITM_M,');
   Add('ERGM_M,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('''N''AS ID_SELECAO,');
   Add('NROM_M,');
   Add('CD_COMPRADOR');

   add('from');
   Add('(SELECT');
   Add('CODIGO,');
   Add('PRODUTO,');
   Add('APRESENTACAO,');
   Add('UNID,');
   Add('MAX(VL_UNITARIO_COMPRA) AS UNITARIO,');
   Add('SUM(QT_VENDA) AS QT_VENDA,');
   Add('SUM(ESTQ) AS ESTQ,');
   Add('SUM(UNI_PENDENTE) AS UNI_PENDENTE,');
   Add('SUM(VTPENDENCIAFABRICA) AS VTPENDENCIAFABRICA,');
   Add('SUM(VTPENDENCIACUSTO) AS VTPENDENCIACUSTO,');

   Add('case');
   Add('WHEN  ((((QT_ESTOQUE_MAXIMO + LEADTIME) * SUM(NVL(MEDIA,0)))-(SUM(ESTQ))>0) and ( :PnrDias > 0)) and ');
   Add('   (((:PnrDias + LEADTIME)* SUM(NVL(MEDIA,0))- (SUM(ESTQ)))>0) THEN');
   Add('       (round(((:PnrDias + LEADTIME)* SUM(NVL(MEDIA,0)) - (SUM(ESTQ)))/ EMB_COMPRA,0)*EMB_COMPRA)');
   Add('WHEN  ((((QT_ESTOQUE_MAXIMO + LEADTIME) * SUM(NVL(MEDIA,0)))-(SUM(ESTQ))>0) and ( :PnrDias = 0)) THEN');
   Add('       (round(((QT_ESTOQUE_MAXIMO + LEADTIME)* SUM(NVL(MEDIA,0)) - (SUM(ESTQ)))/ EMB_COMPRA,0)*EMB_COMPRA)');
   Add('WHEN  (((((QT_ESTOQUE_MAXIMO + LEADTIME) * SUM(NVL(MEDIA,0)))-(SUM(ESTQ))>0) and ( :PnrDias > 0)) and ');
   Add('       ((round(((:PnrDias + LEADTIME)* SUM(NVL(MEDIA,0)) - (SUM(ESTQ)))/ EMB_COMPRA,0)*EMB_COMPRA)<0)) THEN 0');
   Add('ELSE 0');
   Add('END  SUG_CPRA,');
   Add('case');
   Add('WHEN  (((QT_ESTOQUE_MAXIMO + LEADTIME) * SUM(NVL(MEDIA,0)))-(SUM(ESTQ)+ SUM(UNI_PENDENTE))>0) and ');
   Add('   ( :PnrDias > 0) and  (((:PnrDias + LEADTIME)* SUM(NVL(MEDIA,0))- (SUM(ESTQ)+ SUM(UNI_PENDENTE)))>0) THEN');
   Add('       (round(((:PnrDias + LEADTIME)* SUM(NVL(MEDIA,0)) - (SUM(ESTQ)+ SUM(UNI_PENDENTE)))/ EMB_COMPRA,0)*EMB_COMPRA)');
   Add('WHEN  ((QT_ESTOQUE_MAXIMO + LEADTIME) * SUM(NVL(MEDIA,0)))-(SUM(ESTQ)+ SUM(UNI_PENDENTE))>0 ');
   Add(' and ( :PnrDias = 0) and (((QT_ESTOQUE_MAXIMO + LEADTIME)* SUM(NVL(MEDIA,0))- (SUM(ESTQ)+ SUM(UNI_PENDENTE)))>0) THEN');
   Add('       (round(((QT_ESTOQUE_MAXIMO + LEADTIME)* SUM(NVL(MEDIA,0)) - (SUM(ESTQ)+ SUM(UNI_PENDENTE)))/ EMB_COMPRA,0)*EMB_COMPRA)');
   Add('ELSE 0');
   Add('END  SUG_CPRA_PEND,');

   Add('EMB_COMPRA,');
   Add('SUM(NVL(MES3,0)) AS MES3,');
   Add('SUM(NVL(MES2,0)) AS MES2,');
   Add('SUM(NVL(MES1,0)) AS MES1,');
   Add('SUM(NVL(MES0,0)) AS MES0,');
   Add('CURVA,');
   Add('GRUPO,');
   Add('QT_ESTOQUE_MAXIMO ,');
   Add('LEADTIME ,');
   Add('MAX(NVL(DIAS_SEM_ESTOQUE,0)) AS DIAS_SEM_ESTOQUE,');
   Add('NVL(NR_DIAS,0) AS NR_DIAS,');
   Add('MAX(NVL(NR_DIAS_DIV,0)) AS NR_DIAS_DIV,');
   Add('SUM(NVL(MEDIA,0)) AS MEDIA,');
   Add('SUM(NVL((MEDIA* 30),0)) AS MEDIA_MES,');
   Add('MAX(NVL(DIAS_ESTOQUE_ZERO,0)) AS DIAS_ESTOQUE_ZERO,');
   Add('EITM_M,');
   Add('ERGM_M,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('''N''AS ID_SELECAO,');
   Add('NROM_M,');
   Add('CD_COMPRADOR');


   Add(' FROM');
   Add('(SELECT');
   Add('CODIGO,');
   Add('NM_PRODUTO PRODUTO,');
   Add('NM_APRESENTACAO AS APRESENTACAO,');
   Add('UNID,');
   Add('NVL(UNITARIO,0) AS UNITARIO,');
   Add('NVL(VDA_TRIME,0) AS  QT_VENDA,');
   Add('NVL(ESTQ,0) AS ESTQ,');
   Add('UNI_PENDENTE,');
   Add('VTPENDENCIAFABRICA,');
   Add('VTPENDENCIACUSTO,');
   Add('CASE');
   Add(' WHEN  (NR_DIAS - DIAS_SEM_ESTOQUE)<=0 THEN 0');
   Add(' WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PnrDias + LEADTIME)  -  (ESTQ),0)>0 THEN');
   Add('       ROUND(ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PnrDias + LEADTIME)  -  (ESTQ),0)/EMB_COMPRA,0) * EMB_COMPRA');
   Add('ELSE 0');
   Add(' END SUG_CPRA,');
   Add('CASE');
   Add('WHEN  (NR_DIAS - DIAS_SEM_ESTOQUE)<=0 THEN 0');
   Add('WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PnrDias + LEADTIME)  -  (ESTQ+UNI_PENDENTE),0)>0 THEN');
   Add('      ROUND(ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PnrDias + LEADTIME)  -  (ESTQ+UNI_PENDENTE),0)/EMB_COMPRA,0) * EMB_COMPRA');
   Add('ELSE 0');
   Add('END SUG_CPRA_PEND,');
   Add('EMB_COMPRA,');
   Add('NVL(MES3,0) AS MES3,');
   Add('NVL(MES2,0) AS MES2,');
   Add('NVL(MES1,0) AS MES1,');
   Add('NVL(MES0,0) AS MES0,');
   Add('CURVA,');
   Add('GRUPO_CURVA AS GRUPO,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('LEADTIME ,');
   Add('NVL(DIAS_SEM_ESTOQUE,0) AS DIAS_SEM_ESTOQUE,');
   Add('NVL(NR_DIAS,0) AS NR_DIAS,');
   Add('NVL(NR_DIAS_DIV,0) AS NR_DIAS_DIV,');
   Add('NVL(MEDIA,0) AS MEDIA,');
   Add('NVL((MEDIA* 30),0) AS MEDIA_MES,');
   Add('NVL(DIAS_ESTOQUE_ZERO,0) AS DIAS_ESTOQUE_ZERO,');
   Add('DS_NIVEL_EITM AS EITM_M,');
   Add('DS_NIVEL_ERGM AS ERGM_M,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('''N'' AS ID_SELECAO,');
   Add('NR_PRODUTO AS NROM_M,');
   Add('CD_COMPRADOR,');
   Add('CD_EMPRESA,VL_UNITARIO_COMPRA');
   Add('FROM');
   Add('((SELECT');
   Add('CD_PRODUTO CODIGO,');
   Add('NM_PRODUTO,');
   Add('NM_APRESENTACAO,');
   Add('UNID,');
   Add('PRECO_VENDA UNITARIO,');
   Add('MES3+MES2+MES1 VDA_TRIME,');
   Add('ROUND((MES3+MES2+MES1) /');
   Add('ROUND((ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) - NVL(DIAS_ESTOQUE_ZERO,0)),2) *QT_ESTOQUE_MAXIMO,0) AS PREV,');
   Add('ESTOQUE AS ESTQ,');
   Add('EMB_COMPRA,');
   Add('MES3,');
   Add('MES2,');
   Add('MES1,');
   Add('MES0,');
   Add('CURVA,');
   Add('GRUPO_CURVA AS GRUPO,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('LEADTIME ,');
   Add('DIAS_ESTOQUE_ZERO AS DIAS_SEM_ESTOQUE,');
   Add('NR_PRODUTO,');
   Add('UNI_PENDENTE,');
   Add('VTPENDENCIAFABRICA,');
   Add('VTPENDENCIACUSTO,');
   Add('GRUPO_CURVA,');
   Add('DIAS_ESTOQUE_ZERO,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   ADD('CASE');
   ADD(' WHEN Sum(QT_PREVISAO)>0 THEN Sum(QT_PREVISAO)');
   ADD(' WHEN (Sum(QT_PREVISAO)=0) and  (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) - NVL(DIAS_ESTOQUE_ZERO,0))>0 THEN');
   Add('ROUND((MES3+MES2+MES1) /  (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) - NVL(DIAS_ESTOQUE_ZERO,0)),2)');
   ADD('ELSE');
   ADD('ROUND(MES0/(SELECT EXTRACT(DAY FROM sysdate) from dual),2)');
   ADD('END MEDIA,');
   Add('ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0) -  ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) AS NR_DIAS,');
   Add('DS_NIVEL_EITM,');
   Add('DS_NIVEL_ERGM,');
   Add('NR_DIAS_DIV,');
   Add('CD_COMPRADOR,');
   Add('CD_EMPRESA,VL_UNITARIO_COMPRA,Sum(QT_PREVISAO) AS QT_PREVISAO ');
   Add('FROM');
   Add('(SELECT');
   Add('MERC.CD_MERCADORIA AS NR_PRODUTO,');
   Add('MERC.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,');
   Add('MERC.NM_MERCADORIA NM_PRODUTO,');
   Add('MERC.DS_APRESENTACAO_MERCADORIA AS NM_APRESENTACAO,');
   Add('DS_UNIDADE_MEDIDA UNID,');
   Add('VL_PRECO_VENDA PRECO_VENDA,');
   Add('NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,');
   Add('NVL(VTPENDENCIAFABRICA,0) AS VTPENDENCIAFABRICA,');
   Add('NVL(VTPENDENCIACUSTO,0) AS VTPENDENCIACUSTO,');
   Add('CM1.ID_CURVA_MERCADORIA AS CURVA,');
   Add('(QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) AS ESTOQUE,');
   Add('GF.CD_GRUPO_CURVA_FABRICANTE GRUPO_CURVA,');
   Add('QT_DIAS_LEADTIME_FABRICANTE LEADTIME,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('QT_EMBALAGEM_COMPRA AS EMB_COMPRA,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('DS_NIVEL_EITM,');
   Add('DS_NIVEL_ERGM,');
   Add('CD_COMPRADOR, ');
   Add('EM.CD_EMPRESA,VL_UNITARIO_COMPRA ');
   Add('FROM');
   Add('PRDDM.DC_ESTOQUE_MERCADORIA EM');
   Add('JOIN PRDDM.DC_COMPRA_MERCADORIA CM1 ON CM1.CD_MERCADORIA=EM.CD_MERCADORIA AND CM1.CD_EMPRESA=EM.CD_EMPRESA AND CM1.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
   Add('JOIN PRDDM.DC_MERCADORIA MERC ON MERC.CD_MERCADORIA=CM1.CD_MERCADORIA AND CM1.CD_GRUPO_FORNECEDOR=:PnrFornecedor AND CM1.ID_SITUACAO_MERCADORIA=''A'' AND  MERC.ID_SITUACAO_MERCADORIA=''A''');
   Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FM ON FM.CD_MERCADORIA=MERC.CD_MERCADORIA AND FM.CD_MERCADORIA=CM1.CD_MERCADORIA  AND  FM.CD_EMPRESA=EM.CD_EMPRESA');
   Add('JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON   GF.CD_GRUPO_FORNECEDOR=CM1.CD_GRUPO_FORNECEDOR');
   Add('JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM ON GFM.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE AND GFM.ID_CURVA_MERCADORIA=CM1.ID_CURVA_MERCADORIA');
   Add('LEFT OUTER JOIN');
   Add('(SELECT');
   Add('CD_MERCADORIA,Max(VL_UNITARIO_COMPRA) as VL_UNITARIO_COMPRA');
   Add(',CD_EMPRESA');
   Add('FROM');
   Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR A');
   Add('WHERE');
   Add('A.DT_MUDANCA_PRECO=(SELECT MAX(B.DT_MUDANCA_PRECO)');
   Add('FROM');
   Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
   Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
   Add('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
   Add('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
   Add('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
   Add(' and compra.ID_SITUACAO_MERCADORIA=''A''');
   Add('AND B.DT_ATUALIZACAO <=TRUNC(SYSDATE) AND B.CD_EMPRESA= a.CD_EMPRESA)');
   Add('GROUP BY CD_MERCADORIA,CD_EMPRESA');
   add(') LISTA_PRECO ON LISTA_PRECO.CD_MERCADORIA=MERC.CD_MERCADORIA');
   ADD('AND LISTA_PRECO.CD_EMPRESA=EM.CD_EMPRESA');
   Add('LEFT OUTER JOIN');
   Add('(SELECT   CM1.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
   Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,');
   Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
   Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
   Add('NM_MERCADORIA,');
   Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_PENDENCIA_ITEM');
   Add(' FROM');
   Add('PRDDM.DCPCC CAPA,');
   Add('PRDDM.DCPCI ITEM,');
   Add('PRDDM.DC_COMPRA_MERCADORIA CM1,');
   Add('PRDDM.DC_MERCADORIA M1');
   Add(' WHERE');
   Add(' NROP_P=NROP_Y');
   Add('AND NROM_Y=CM1.CD_MERCADORIA');
   Add('AND CM1.ID_SITUACAO_MERCADORIA=''A''');
   Add('AND CM1.CD_MERCADORIA=M1.CD_MERCADORIA');
   Add('AND ITEM.CD_EMPRESA=CM1.CD_EMPRESA');
   Add('AND SITP_P IN(''N'',''P'')');
   Add('AND SITY_Y IN(''N'',''P'')');
   Add('AND CM1.CD_GRUPO_FORNECEDOR = :PnrFornecedor');
   if PnrCD>0 then
   Add('AND CM1.CD_EMPRESA=:PnrCD');
   Add('GROUP BY CM1.CD_MERCADORIA*10+NR_DV_MERCADORIA,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA) PENDENCIA ON PENDENCIA.CD_PRODUTO=MERC.CD_MERCADORIA*10+NR_DV_MERCADORIA AND CD_PENDENCIA_ITEM=EM.CD_EMPRESA ) PRODUTO');
   Add('LEFT OUTER JOIN (SELECT');
   Add('CD_MERCADORIA AS NR_PRODUTO_2,');
   Add('CD_EMPRESA_02,');
   Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
   Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
   Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
   Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
   Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
   Add('SUM(NR_DIAS_DIV) AS NR_DIAS_DIV,');
   Add('SUM(QT_VENDIDA) AS QT_VENDA');
   Add('FROM');
   Add('(SELECT');
   Add('CM.CD_MERCADORIA ,');
   Add('VM.CD_EMPRESA AS CD_EMPRESA_02,');
   Add('SUM(QT_VENDIDA) QT_VENDIDA,');
   Add('CASE');
   Add('WHEN CD_OPERADOR_LOGISTICO=1 THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
   Add('END QT_DIAS_ESTOQUE_ZERO,');
   Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
   Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
   Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
   Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
   Add('           (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),-1)  - MAX(DT_VENDA_MERCADORIA)) NR_DIAS_DIV');
   Add(' FROM');
   Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VM,');
   Add('PRDDM.DC_COMPRA_MERCADORIA CM');
   Add('WHERE');
   Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
   Add('AND    VM.CD_EMPRESA=CM.CD_EMPRESA');
   Add('AND  cd_canal=0');
   Add('AND  CM.ID_SITUACAO_MERCADORIA=''A''');
   if (PnrCD>=1) then
      Add('AND    VM.CD_EMPRESA=:PnrCD');
   Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
   Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   Add('AND DT_VENDA_MERCADORIA<= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
   Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
   Add('GROUP BY CD_MERCADORIA,CD_EMPRESA_02) VENDA ON VENDA.NR_PRODUTO_2 =NR_PRODUTO AND CD_EMPRESA=CD_EMPRESA_02');


   Add(' LEFT OUTER JOIN  (SELECT');
   Add('COMPRA.CD_EMPRESA AS CD_EMPRESA_P,');
   Add('COMPRA.CD_MERCADORIA ,');
   Add('CASE');
   Add('WHEN  QT_PREVISAO>0 THEN ROUND(QT_PREVISAO /30,4)');
   Add('WHEN  QT_PREVISAO<=0 THEN 0');
   Add('WHEN QT_PREVISAO IS NULL THEN 0');
   Add('END QT_PREVISAO,');
   Add(' NVL(DT_PREVISAO ,TRUNC(SYSDATE,''MONTH'')) AS DT_PREVISAO');
   Add(' FROM');
   Add('  PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
   Add('  GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
   Add('WHERE');
   Add('  PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
   Add('  AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
   Add('  AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
   if (PnrCD>=1) then
      Add('AND   COMPRA.CD_EMPRESA=:PnrCD');

   Add('  AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
   Add('  AND DT_PREVISAO(+)=TRUNC(SYSDATE,''MONTH'')) PREVISAO ON  PREVISAO.CD_MERCADORIA=NR_PRODUTO');
   Add('                                               AND PREVISAO.CD_EMPRESA_P=CD_EMPRESA');




   Add('WHERE');
   Add('CD_COMPRADOR=:PnrComprador');
   Add('GROUP BY');
   Add('NR_PRODUTO,');
   Add('CD_PRODUTO,');
   Add('NM_PRODUTO,');
   Add('NM_APRESENTACAO,');
   Add('UNID,');
   Add('PRECO_VENDA,');
   Add('UNI_PENDENTE,');
   Add('VTPENDENCIAFABRICA,');
   Add('VTPENDENCIACUSTO,');
   Add('CURVA,');
   Add('ESTOQUE,');
   Add('GRUPO_CURVA,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('MES3,');
   Add('MES2,');
   Add('MES1,');
   Add('MES0,');
   Add('GRUPO_CURVA,');
   Add('LEADTIME ,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('NR_PRODUTO,');
   Add('UNI_PENDENTE,');
   Add('VTPENDENCIAFABRICA,');
   Add('VTPENDENCIACUSTO,');
   Add('GRUPO_CURVA,');
   Add('LEADTIME,');
   Add('CURVA,');
   Add('DIAS_ESTOQUE_ZERO,');
   Add('EMB_COMPRA,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('DS_NIVEL_EITM,');
   Add('DS_NIVEL_ERGM,');
   Add('NR_DIAS_DIV,');
   Add('CD_COMPRADOR,');
   Add('CD_EMPRESA,VL_UNITARIO_COMPRA');
   Add('ORDER BY NM_PRODUTO,NM_APRESENTACAO)))');
   Add('WHERE');
   Add('  CD_COMPRADOR=:PnrComprador');
   if (PnrCD>=1) then
   Add('  AND CD_EMPRESA=:PnrCD');
   Add('GROUP BY');
   Add('CODIGO, ');
   Add('PRODUTO,');
   Add('APRESENTACAO,');
   Add('UNID,');
   Add('EMB_COMPRA,');
   Add('CURVA,');
   Add('GRUPO,');
   Add('QT_ESTOQUE_MAXIMO,');
   Add('LEADTIME ,');
   Add('NR_DIAS,');
   Add('EITM_M,');
   Add('ERGM_M,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('ID_SELECAO,');
   Add('NROM_M,');
   Add('CD_COMPRADOR)');
   Add('GROUP BY');
   Add('CODIGO, ');
   Add('PRODUTO,');
   Add('APRESENTACAO,');
   Add('UNID,');
   Add('EMB_COMPRA,');
//   Add('CURVA,');
   Add('GRUPO,');
//   Add('QT_ESTOQUE_MAXIMO,');
   Add('LEADTIME ,');
   Add('NR_DIAS,');
   Add('EITM_M,');
   Add('ERGM_M,');
   Add('PC_DESCONTO_PADRAO_COMPRA,');
   Add('ID_SELECAO,');
   Add('NROM_M,');
   Add('CD_COMPRADOR');

   stQry.SaveToFile('c:\temp\qrySugestao.sql');
   with _cdsSugestaoCompra do
   begin
      Close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
      Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
      if (PnrCD>=1) then
        Params.ParamByName('PnrCD').AsInteger:=PnrCD;
      Params.ParamByName('PnrDias').AsInteger:=PnrDias;
      open;
   end;

 end;
end;

procedure T_frmSugestaodeCompra.CarregaEmpresa;
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


end.
