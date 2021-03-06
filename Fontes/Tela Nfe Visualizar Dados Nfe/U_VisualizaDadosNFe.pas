unit U_VisualizaDadosNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, StdCtrls, DBCtrls,
  ComCtrls, Grids, DBGrids, Provider, SqlExpr, xmldom,
  XMLIntf, msxmldom, XMLDoc, Menus,ShellApi, uDm, FMTBcd;

const
  NM_ARQUIVO_XML = 'ARQ_XML_ATUAL.XML';

type
  T_frmNfeVisualizaDanfe = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EdRazaoSocial: TEdit;
    Label18: TLabel;
    EdSerie: TEdit;
    EdDtEmissao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdNroNF: TEdit;
    Label1: TLabel;
    EdtQtdItem: TEdit;
    Label20: TLabel;
    EdValorItem: TEdit;
    Label19: TLabel;
    EdValorDesc: TEdit;
    Label14: TLabel;
    EdTotalNF: TEdit;
    GroupBox2: TGroupBox;
    DBGridItemNota: TDBGrid;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    StatusBar1: TStatusBar;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    EdTransportador: TEdit;
    EdQtdVolume: TEdit;
    EdPesoBruto: TEdit;
    EdEspecie: TEdit;
    EdPesoLiquido: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    EdBaseICMS: TEdit;
    Label11: TLabel;
    EdVlrICMS: TEdit;
    Label15: TLabel;
    EdVlrIPI: TEdit;
    Label12: TLabel;
    EdBaseST: TEdit;
    Label13: TLabel;
    EdVlrST: TEdit;
    Label16: TLabel;
    EdVlrPIS: TEdit;
    Label17: TLabel;
    EdVlrCOFINS: TEdit;
    CDS_DADOS_NFE: TClientDataSet;
    CDS_DADOS_NFENRO_NFE: TStringField;
    CDS_DADOS_NFEDT_EMISSAO_NFE: TStringField;
    CDS_DADOS_NFESERIE_NFE: TStringField;
    CDS_DADOS_NFENM_FABRICANTE: TStringField;
    CDS_DADOS_NFENRO_PEDIDO_COMPRA: TStringField;
    CDS_DADOS_NFECNPJ_EMISSOR: TStringField;
    CDS_DADOS_NFEBC_ICMS: TFloatField;
    CDS_DADOS_NFEVLR_ICMS: TFloatField;
    CDS_DADOS_NFEVLR_NFE: TFloatField;
    CDS_DADOS_NFEVLR_DESC: TFloatField;
    CDS_DADOS_NFEVLR_PRODUTO: TFloatField;
    CDS_DADOS_NFEVLR_IPI: TFloatField;
    CDS_DADOS_NFEVLR_PIS: TFloatField;
    CDS_DADOS_NFEVLR_COFINS: TFloatField;
    CDS_DADOS_NFEBC_ST: TFloatField;
    CDS_DADOS_NFEVLR_ST: TFloatField;
    CDS_DADOS_ITEM: TClientDataSet;
    CDS_DADOS_ITEMCOD_PRODUTO: TStringField;
    CDS_DADOS_ITEMEAN_PRODUTO: TStringField;
    CDS_DADOS_ITEMNOME_PRODUTO: TStringField;
    CDS_DADOS_ITEMNCM: TStringField;
    CDS_DADOS_ITEMVLR_DESC: TStringField;
    CDS_DADOS_ITEMCFOP: TStringField;
    CDS_DADOS_ITEMIPI_BC: TStringField;
    CDS_DADOS_ITEMIPI_PERC: TStringField;
    CDS_DADOS_ITEMIPI_VLR: TStringField;
    CDS_DADOS_ITEMPIS_BC: TStringField;
    CDS_DADOS_ITEMPIS_PERC: TStringField;
    CDS_DADOS_ITEMPIS_VLR: TStringField;
    CDS_DADOS_ITEMCOFINS_BC: TStringField;
    CDS_DADOS_ITEMCOFINS_PERC: TStringField;
    CDS_DADOS_ITEMCOFINS_VLR: TStringField;
    CDS_DADOS_ITEMICMS_CST: TStringField;
    CDS_DADOS_ITEMLOTE_NRO_LOTE: TStringField;
    CDS_DADOS_ITEMLOTE_FABRICACAO_LOTE: TStringField;
    CDS_DADOS_ITEMLOTE_VALIDADE_LOTE: TStringField;
    CDS_DADOS_ITEMLOTE_PRECO_CONS: TStringField;
    CDS_DADOS_ITEMLOTE_QTD_LOTE: TStringField;
    CDS_DADOS_ITEMUNIDADE_ITEM: TStringField;
    CDS_DADOS_ITEMVLR_UNIT_PRODUTO: TFloatField;
    CDS_DADOS_ITEMVLR_TOTAL_PRODUTO: TFloatField;
    CDS_DADOS_ITEMICMS_BC: TFloatField;
    CDS_DADOS_ITEMICMS_PERC: TFloatField;
    CDS_DADOS_ITEMICMS_VLR: TFloatField;
    CDS_DADOS_ITEMQTD_PRODUTO: TIntegerField;
    CDS_DADOS_ITEMICMS_PC_REDUCAO_BASE_CALCULO: TFloatField;
    CDS_DADOS_ITEMICMS_BCST: TFloatField;
    CDS_DADOS_ITEMICMS_VLR_BCST: TFloatField;
    CDS_DADOS_ITEMALERTA_ITEM: TStringField;
    DS_DADOS_ITEM: TDataSource;
    CDS_DADOS_LOTE_ITEM: TClientDataSet;
    CDS_DADOS_LOTE_ITEMNRO_LOTE: TStringField;
    CDS_DADOS_LOTE_ITEMQTD_LOTE: TStringField;
    CDS_DADOS_LOTE_ITEMDT_FABRICACAO: TStringField;
    CDS_DADOS_LOTE_ITEMDT_VALIDADE: TStringField;
    CDS_DADOS_LOTE_ITEMVLR_PRECO_CONSUMIDOR: TStringField;
    CDS_DADOS_TRANSPORTE: TClientDataSet;
    CDS_DADOS_TRANSPORTENOME_TRASPORTADOR: TStringField;
    CDS_DADOS_TRANSPORTEQTD_VOLUME: TIntegerField;
    CDS_DADOS_TRANSPORTEPESO_LIQUIDO: TStringField;
    CDS_DADOS_TRANSPORTEPESO_BRUTO: TStringField;
    CDS_DADOS_TRANSPORTEESPECIE_VOLUME: TStringField;
    CDS_DADOS_ADC: TClientDataSet;
    CDS_DADOS_ADCDS_DADOS_ADC: TMemoField;
    CDS_DADOS_ADCDS_DADOS_FISCO: TMemoField;
    CDS_DADOS_DUPLICATA: TClientDataSet;
    CDS_DADOS_DUPLICATANR_DUPLICATA: TStringField;
    CDS_DADOS_DUPLICATAVLR_DUPLICATA: TFloatField;
    CDS_DADOS_DUPLICATADT_VENCIMENTO: TDateField;
    DS_DADOS_DUPLICATA: TDataSource;
    Mem_rec_XML: TMemo;
    XMLDoc: TXMLDocument;
    mmDadosAdc: TMemo;
    PopupMenu1: TPopupMenu;
    GERARPLANILHAEXCEL1: TMenuItem;
    qryconsulta_GED: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure GerarPlanilha1Click(Sender: TObject);
    procedure DBGridItemNotaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure GERARPLANILHAEXCEL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NRO_CHAVE_NFE : string;
    NRO_PEDIDO_COMPRA : string;
    DS_REFERENCIA_ITEM : string;
    procedure ConsultaChaveNF(dsChaveNFe:string);
    procedure ListaXML_GED(dsChave:string);
    procedure CriaDataSet;
    procedure CarregaDadosDANFE;
    procedure LimpaVariavel;
    procedure ProcessaXML(nmArquivo:string);
    procedure GravaDadoPrincipal;
    procedure GravaDadoItem;
    procedure GravaDadoloteItem;
    procedure GravaDadoadicional;
    procedure GravaDadoDuplicata;
    procedure GravaDadoTransporte;
    function TiraPonto(valor:string):string;
    function formataLote(dsLote:string):string;
    function formataData(Data:string):string;
    function formataCodigoProd(vlr:string):string;
    function trocaPontoVirgula(valor:string):string;
    function ValidaValor(Valor:string):string;
    function TiraEspaco(Texto : WideString):WideString;
    function formataValorNumerico(Valor:string):string;
    procedure GeraPlanilhaItemDANFE;
    function FormataTagQtdProduto(vlr:string):string;
  end;

var
  _frmNfeVisualizaDanfe: T_frmNfeVisualizaDanfe;

implementation

uses  URotinasGenericas, URelacaoNFeRecebida,
  U_VisualizaCriticaPedidoNFe;

var
  ide_cUF : string;
  ide_cNF : string;
  ide_natOp : string;
  ide_indPag : string;
  ide_mod : string;
  ide_serie : string;
  ide_nNF : string;
  ide_dEmi : string;
  ide_dSaiEnt : string;
  ide_tpNF : string;
  ide_cMunFG : string;
  ide_tpImp : string;
  ide_tpEmis : string;
  ide_cDV : string;
  ide_tpAmb : string;
  ide_finNFe : string;
  ide_procEmi : string;
  ide_verProc : string;

  emit_CNPJ : string;
  emit_xNome : string;
  emit_xFant : string;
    emit_enderemit_xLgr : string;
    emit_enderemit_nro : string;
    emit_enderemit_xCpl : string;
    emit_enderemit_xBairro : string;
    emit_enderemit_cMun : string;
    emit_enderemit_xMun : string;
    emit_enderemit_UF : string;
    emit_enderemit_CEP : string;
    emit_enderemit_cPais : string;
    emit_enderemit_xPais : string;
    emit_enderemit_fone : string;
  emit_IE : string;

  dest_CNPJ : string;
  dest_xNome : string;
    dest_enderDest_xLgr : string;
    dest_enderDest_nro : string;
    dest_enderDest_xBairro : string;
    dest_enderDest_cMun : string;
    dest_enderDest_xMun : string;
    dest_enderDest_UF : string;
    dest_enderDest_CEP : string;
    dest_enderDest_cPais : string;
    dest_enderDest_xPais : string;
  dest_IE : string;

  det_prod_cProd : string;
  det_prod_cEAN : string;
  det_prod_xProd : string;
  det_prod_NCM : string;
  det_prod_CFOP : string;
  det_prod_uCom : string;
  det_prod_qCom : string;
  det_prod_vUnCom : string;
  det_prod_vProd : string;
  det_prod_cEANTrib : string;
  det_prod_uTrib : string;
  det_prod_qTrib : string;
  det_prod_vUnTrib : string;
  det_prod_vDesc : string;
    det_prod_med_nLote : string;
    det_prod_med_qLote : string;
    det_prod_med_dFab : string;
    det_prod_med_dVal : string;
    det_prod_med_vPMC : string;

  det_imposto_ICMS_orig : string;
  det_imposto_ICMS_CST : string;
  det_imposto_ICMS_modBC : string;
  det_imposto_ICMS_vBC : string;
  det_imposto_ICMS_pICMS : string;
  det_imposto_ICMS_vICMS : string;
  det_imposto_ICMS_modBCST : string;
  det_imposto_ICMS_pMVAST : string;
  det_imposto_ICMS_pRedBCST : string;
  det_imposto_ICMS_vBCST : string;
  det_imposto_ICMS_pICMSST : string;
  det_imposto_ICMS_vICMSST : string;
  det_imposto_ICMS_pRedBC : string;


  det_imposto_IPI_cEnq : string;
  det_imposto_IPI_CST : string;
  det_imposto_IPI_vBC : string;
  det_imposto_IPI_pIPI : string;
  det_imposto_IPI_vIPI : string;

  det_imposto_PIS_CST : string;
  det_imposto_PIS_vBC : string;
  det_imposto_PIS_pPIS : string;
  det_imposto_PIS_vPIS : string;
  det_imposto_PIS_qBCProd : string;
  det_imposto_PIS_vAliqProd : string;

  det_imposto_COFINS_CST : string;
  det_imposto_COFINS_vBC : string;
  det_imposto_COFINS_pCOFINS : string;
  det_imposto_COFINS_vCOFINS : string;
  det_imposto_COFINS_qBCProd : string;
  det_imposto_COFINS_vAliqProd : string;

  total_ICMSTot_vBC : string;
  total_ICMSTot_vICMS : string;
  total_ICMSTot_vBCST : string;
  total_ICMSTot_vST : string;
  total_ICMSTot_vProd : string;
  total_ICMSTot_vFrete : string;
  total_ICMSTot_vSeg : string;
  total_ICMSTot_vDesc : string;
  total_ICMSTot_vII : string;
  total_ICMSTot_vIPI : string;
  total_ICMSTot_vPIS : string;
  total_ICMSTot_vCOFINS : string;
  total_ICMSTot_vOutro : string;
  total_ICMSTot_vNF : string;

  transp_modFrete : string;
    transp_transporta_CNPJ : string;
    transp_transporta_xNome : string;
    transp_transporta_IE : string;
    transp_transporta_xEnder : string;
    transp_transporta_xMun : string;
    transp_transporta_UF : string;

    transp_vol_qVol : string;
    transp_vol_esp : string;
    transp_vol_pesoL : string;
    transp_vol_pesoB : string;

  cobr_dup_nDup : string;
  cobr_dup_dVenc : string;
  cobr_dup_vDup : string;

  cobr_fat_nFat : string;
  cobr_fat_VOrig : string;
  cobr_fat_vDesc : string;
  cobr_fat_vLiq : string;


  infAdic_infCpl : WideString;
  infAdic_infAdFisco : WideString;

  compra_xPed : string;

{$R *.dfm}

function T_frmNfeVisualizaDanfe.FormataTagQtdProduto(vlr:string):string;
var
  I : integer;
  caracter,valorNovo : string;
  AchouPonto : Boolean;
begin
  valorNovo:='';
  AchouPonto:=false;
  for I:=1 to length(vlr) do
  begin
    caracter:=copy(vlr,I,1);
    if caracter = '.' then
    begin
      AchouPonto:=true;
      valorNovo:=valorNovo + caracter + '0000';
      break;
    end
    else
    begin
      AchouPonto:=false;
      valorNovo:=valorNovo + caracter;
    end;
  end;
  if AchouPonto = true then
    Result:=valorNovo
  else
    Result:=valorNovo + '.0000';
end;




procedure T_frmNfeVisualizaDanfe.GeraPlanilhaItemDANFE;
var
  I, Row ,erro_2,erro_1 : Integer;
  Nr_colounas   :Integer;
  NR_Linha,NR_Coluna:Integer;
  VL_campo :Double;
begin
  CDS_DADOS_ITEM.First;
  if not CDS_DADOS_ITEM.IsEmpty then
  begin
    StatusBar1.SimpleText :='Gerando Planilha Excel...';
    StatusBar1.Refresh;
    Nr_colounas   :=0;
    with dm.Planilha_padrao do
    begin
      NM_Arquivo:='Nota_' + CDS_DADOS_NFENRO_NFE.AsString + '.XLS';
      Newfile;
      FileName :=   dir_micro+'Arquivos_Hp\'+NM_Arquivo;
      Borders := [ ebTop, ebBottom, ebLeft, ebRight ];
      SetHeader('Sistema de Compras GAM');
      SetFooter('&N &P');
      WriteLabel(1,1,'FORNECEDOR   : ' + EdRazaoSocial.Text);
      WriteLabel(2,1,'NOTA FISCAL  : ' + trim(EdNroNF.text));
      WriteLabel(3,1,'DT EMISS?O   : ' + EdDtEmissao.text);
      WriteLabel(4,1,'PEDIDO COMPRA: ' + NRO_PEDIDO_COMPRA);

      {
      for I := 0 to 11 do
      begin
       WriteLabel(6,I+1, CDS_DADOS_ITEM.Fields [I].DisplayLabel);
      end;
      }
      // CABE?ALHO
      WriteLabel(6,1, 'CODIGO');
      WriteLabel(6,2, 'NOME PRODUTO');
      WriteLabel(6,3, 'NCM');
      WriteLabel(6,4, 'CST');
      WriteLabel(6,5, 'CFOP');
      WriteLabel(6,6, 'UN');
      WriteLabel(6,7, 'QTD');
      WriteLabel(6,8, 'VLR UNIT');
      WriteLabel(6,9, 'VLR TOTAL');
      WriteLabel(6,10,'ICMS BC');
      WriteLabel(6,11,'ICMS VLR');
      WriteLabel(6,12,'ICMS %');

      NR_Linha:=7;
      while not CDS_DADOS_ITEM.Eof do
      begin
        if CDS_DADOS_ITEMCOD_PRODUTO.AsString <> Null then
           WriteLabel(NR_Linha,1,CDS_DADOS_ITEMCOD_PRODUTO.Asstring)
        else
           WriteLabel(NR_Linha,1,'      ');

        if CDS_DADOS_ITEMNOME_PRODUTO.AsString <> Null then
           WriteLabel(NR_Linha,2,CDS_DADOS_ITEMNOME_PRODUTO.AsString)
        else
           WriteLabel(NR_Linha,2,'      ');

        if CDS_DADOS_ITEMNCM.AsInteger <> Null then
           WriteNumber(NR_Linha,3,CDS_DADOS_ITEMNCM.AsInteger)
        else
           WriteLabel(NR_Linha,3,'      ');

        if CDS_DADOS_ITEMICMS_CST.AsString <> Null then
           WriteLabel(NR_Linha,4,CDS_DADOS_ITEMICMS_CST.Asstring)
        else
           WriteLabel(NR_Linha,4,'      ');

        if CDS_DADOS_ITEMCFOP.AsInteger <> Null then
           WriteNumber(NR_Linha,5,CDS_DADOS_ITEMCFOP.AsInteger)
        else
           WriteLabel(NR_Linha,5,'      ');

        if CDS_DADOS_ITEMUNIDADE_ITEM.AsString <> Null then
           WriteLabel(NR_Linha,6,CDS_DADOS_ITEMUNIDADE_ITEM.Asstring)
        else
           WriteLabel(NR_Linha,6,'      ');

        if CDS_DADOS_ITEMQTD_PRODUTO.AsInteger <> Null then
           WriteNumber(NR_Linha,7,CDS_DADOS_ITEMQTD_PRODUTO.AsInteger)
        else
           WriteLabel(NR_Linha,7,'      ');

        if CDS_DADOS_ITEMVLR_UNIT_PRODUTO.AsFloat <> Null then
           WriteNumber(NR_Linha,8,CDS_DADOS_ITEMVLR_UNIT_PRODUTO.AsFloat)
        else
           WriteLabel(NR_Linha,8,'      ');

        if CDS_DADOS_ITEMVLR_TOTAL_PRODUTO.AsFloat <> Null then
           WriteNumber(NR_Linha,9,CDS_DADOS_ITEMVLR_TOTAL_PRODUTO.AsFloat)
        else
           WriteLabel(NR_Linha,9,'      ');

        if CDS_DADOS_ITEMICMS_BC.AsFloat <> Null then
           WriteNumber(NR_Linha,10,CDS_DADOS_ITEMICMS_BC.AsFloat)
        else
           WriteLabel(NR_Linha,10,'      ');

        if CDS_DADOS_ITEMICMS_VLR.AsFloat <> Null then
           WriteNumber(NR_Linha,11,CDS_DADOS_ITEMICMS_VLR.AsFloat)
        else
           WriteLabel(NR_Linha,11,'      ');

        if CDS_DADOS_ITEMICMS_PERC.AsFloat <> Null then
           WriteNumber(NR_Linha,12,CDS_DADOS_ITEMICMS_PERC.AsFloat)
        else
           WriteLabel(NR_Linha,12,'      ');

        inc(nr_linha);
        CDS_DADOS_ITEM.Next
      end;

      SetLeftMargin  ( 0.30 ); // ** This value has to be in inches **
      SetBottomMargin( 0.30 ); // ** This value has to be in inches **
      SetTopMargin   ( 0.80 ); // ** This value has to be in inches **
      SetRightMargin ( 0.30 ); // ** This value has to be in inches **
      CloseFile;

      TRY
        SaveToFile;
      EXCEPT
        MENSAGEM('Arquivo N?o foi salvo!!!'+#13+
                 'Verifique se o mesmo N?o est? em uso');
      end;
    end;
    Screen.Cursor := 0;
    StatusBar1.SimpleText :='Processo Encerrado!!!';
    StatusBar1.Refresh;
    ShellExecute(0,nil,pchar(dir_micro+'Arquivos_Hp\'+nm_arquivo),nil,nil,sw_showmaximized);
  end;
  CDS_DADOS_ITEM.First;
end;

function T_frmNfeVisualizaDanfe.formataValorNumerico(Valor:string):string;
var
  I : Integer;
  S : string;
begin
  S:=StringReplace(StringReplace( Valor,'.',' ',[rfReplaceAll]),',',' ',[rfReplaceAll]);
  I:=Length(S);
  case I of
    1 : Result:='                       '+Valor;
    2 : Result:='                     '+Valor;
    3 : Result:='                   '+Valor;
    4 : Result:='                 '+Valor;
    5 : Result:='               '+Valor;
    6 : Result:='             '+Valor;
    7 : Result:='           '+Valor;
    8 : Result:='         '+Valor;
    9 : Result:='       '+Valor;
   10 : Result:='     '+Valor;
  end;
end;

function T_frmNfeVisualizaDanfe.TiraEspaco(Texto : WideString):WideString;
begin
  Result := StringReplace( Texto,' ','',[rfReplaceAll]);
end;

function T_frmNfeVisualizaDanfe.TiraPonto(valor:string):string;
begin
  Result:='';
  Result := StringReplace(valor,'.','',[rfReplaceAll]);
end;

function T_frmNfeVisualizaDanfe.formataLote(dsLote:string):string;
var
  I : integer;
  Le_lote : string;
begin
  Result:='';
  for I:=1 to Length(dsLote) do
  begin
    Le_lote:=copy(dsLote,I,1);
    if Le_lote <> ' ' then
      Result:=Result + Le_lote
    else
      break;
  end;
end;

function T_frmNfeVisualizaDanfe.formataData(Data:string):string;
var
  dia,mes,ano : string;
begin
  Result:='';
  dia:=copy(Data,9,2)+ '/';
  mes:=copy(Data,6,2)+ '/';
  ano:=copy(Data,1,4);
  Result:=dia + mes + ano;
end;

function T_frmNfeVisualizaDanfe.formataCodigoProd(vlr:string):string;
var
 I,X : integer;
begin
  X:=6 - Length(vlr);

  for i:=1 to X do
  begin
    vlr:=' ' + vlr;
  end;
  Result:=vlr;
end;

function T_frmNfeVisualizaDanfe.trocaPontoVirgula(valor:string):string;
var
  I : integer;
  Le_valor : string;
  achou_ponto : Boolean;
begin
  Result:='';
  //Result := StringReplace( Texto,'.',',',[rfReplaceAll]);
  achou_ponto:=false;
  for I:=1 to Length(valor) do
  begin
    Le_valor:=copy(valor,I,1);
    if Le_valor = '.' then
    begin
      if achou_ponto = false then
      begin
        Le_valor:=',';
        achou_ponto:=true;
      end
      else
        Le_valor:='';
    end;
    Result:=Result + Le_valor;
  end;

  if achou_ponto = false then
  begin
    I:=Length(valor) - 2;
    Result:=copy(valor,1,I)+ ','+ copy(valor,I+1,2);
  end;

  if Result = '' then
    Result:='0,00';
end;

function T_frmNfeVisualizaDanfe.ValidaValor(Valor:string):string;
begin
  Result:='';
  if Length(Valor) = 0 then
    Result:='0'
  else
    Result:=Valor;
end;

procedure T_frmNfeVisualizaDanfe.LimpaVariavel;
begin
  ide_cUF :=' ';
  ide_cNF :=' ';
  ide_natOp :=' ';
  ide_indPag :=' ';
  ide_mod :=' ';
  ide_serie :=' ';
  ide_nNF :=' ';
  ide_dEmi :=' ';
  ide_dSaiEnt :=' ';
  ide_tpNF :=' ';
  ide_cMunFG :=' ';
  ide_tpImp :=' ';
  ide_tpEmis :=' ';
  ide_cDV :=' ';
  ide_tpAmb :=' ';
  ide_finNFe :=' ';
  ide_procEmi :=' ';
  ide_verProc :=' ';

  emit_CNPJ :=' ';
  emit_xNome :=' ';
  emit_xFant :=' ';
  emit_enderemit_xLgr :=' ';
  emit_enderemit_nro :=' ';
  emit_enderemit_xCpl :=' ';
  emit_enderemit_xBairro :=' ';
  emit_enderemit_cMun :=' ';
  emit_enderemit_xMun :=' ';
  emit_enderemit_UF :=' ';
  emit_enderemit_CEP :=' ';
  emit_enderemit_cPais :=' ';
  emit_enderemit_xPais :=' ';
  emit_enderemit_fone :=' ';
  emit_IE :=' ';

  dest_CNPJ :=' ';
  dest_xNome :=' ';
  dest_enderDest_xLgr :=' ';
  dest_enderDest_nro :=' ';
  dest_enderDest_xBairro :=' ';
  dest_enderDest_cMun :=' ';
  dest_enderDest_xMun :=' ';
  dest_enderDest_UF :=' ';
  dest_enderDest_CEP :=' ';
  dest_enderDest_cPais :=' ';
  dest_enderDest_xPais :=' ';
  dest_IE :=' ';

  det_prod_cProd :=' ';
  det_prod_cEAN :=' ';
  det_prod_xProd :=' ';
  det_prod_NCM :=' ';
  det_prod_CFOP :=' ';
  det_prod_uCom :=' ';
  det_prod_qCom :=' ';
  det_prod_vUnCom :=' ';
  det_prod_vProd :=' ';
  det_prod_cEANTrib :=' ';
  det_prod_uTrib :=' ';
  det_prod_qTrib :=' ';
  det_prod_vUnTrib :=' ';
  det_prod_vDesc :=' ';
  det_prod_med_nLote :=' ';
  det_prod_med_qLote :=' ';
  det_prod_med_dFab :=' ';
  det_prod_med_dVal :=' ';
  det_prod_med_vPMC :=' ';

  det_imposto_ICMS_orig :=' ';
  det_imposto_ICMS_CST :=' ';
  det_imposto_ICMS_modBC :=' ';
  det_imposto_ICMS_vBC :=' ';
  det_imposto_ICMS_pICMS :=' ';
  det_imposto_ICMS_vICMS :=' ';
  det_imposto_ICMS_modBCST :=' ';
  det_imposto_ICMS_pMVAST :=' ';
  det_imposto_ICMS_pRedBCST :=' ';
  det_imposto_ICMS_vBCST :=' ';
  det_imposto_ICMS_pICMSST :=' ';
  det_imposto_ICMS_vICMSST :=' ';
  det_imposto_ICMS_pRedBC :=' ';


  det_imposto_IPI_cEnq :=' ';
  det_imposto_IPI_CST :=' ';
  det_imposto_IPI_vBC :=' ';
  det_imposto_IPI_pIPI :=' ';
  det_imposto_IPI_vIPI :=' ';

  det_imposto_PIS_CST :=' ';
  det_imposto_PIS_vBC :=' ';
  det_imposto_PIS_pPIS :=' ';
  det_imposto_PIS_vPIS :=' ';
  det_imposto_PIS_qBCProd :=' ';
  det_imposto_PIS_vAliqProd :=' ';

  det_imposto_COFINS_CST :=' ';
  det_imposto_COFINS_vBC :=' ';
  det_imposto_COFINS_pCOFINS :=' ';
  det_imposto_COFINS_vCOFINS :=' ';
  det_imposto_COFINS_qBCProd :=' ';
  det_imposto_COFINS_vAliqProd :=' ';

  total_ICMSTot_vBC :=' ';
  total_ICMSTot_vICMS :=' ';
  total_ICMSTot_vBCST :=' ';
  total_ICMSTot_vST :=' ';
  total_ICMSTot_vProd :=' ';
  total_ICMSTot_vFrete :=' ';
  total_ICMSTot_vSeg :=' ';
  total_ICMSTot_vDesc :=' ';
  total_ICMSTot_vII :=' ';
  total_ICMSTot_vIPI :=' ';
  total_ICMSTot_vPIS :=' ';
  total_ICMSTot_vCOFINS :=' ';
  total_ICMSTot_vOutro :=' ';
  total_ICMSTot_vNF :=' ';

  transp_modFrete :=' ';
  transp_transporta_CNPJ :=' ';
  transp_transporta_xNome :=' ';
  transp_transporta_IE :=' ';
  transp_transporta_xEnder :=' ';
  transp_transporta_xMun :=' ';
  transp_transporta_UF :=' ';

  transp_vol_qVol :=' ';
  transp_vol_esp :=' ';
  transp_vol_pesoL :=' ';
  transp_vol_pesoB :=' ';

  cobr_dup_nDup :=' ';
  cobr_dup_dVenc :=' ';
  cobr_dup_vDup :=' ';

  cobr_fat_nFat :=' ';
  cobr_fat_VOrig :=' ';
  cobr_fat_vDesc :=' ';
  cobr_fat_vLiq :=' ';


  infAdic_infCpl := ' ';
  infAdic_infAdFisco := ' ';

  compra_xPed :=' ';
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoPrincipal;
begin
  if CDS_DADOS_NFE.Active = false then
    CDS_DADOS_NFE.Open;

  CDS_DADOS_NFE.Append;
  CDS_DADOS_NFENRO_NFE.AsString:=ide_nNF;
  CDS_DADOS_NFESERIE_NFE.AsString:=ide_serie;
  CDS_DADOS_NFEDT_EMISSAO_NFE.AsString:=ide_dEmi;
  CDS_DADOS_NFENM_FABRICANTE.AsString:=emit_xNome;
  CDS_DADOS_NFEBC_ICMS.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vBC));
  CDS_DADOS_NFEVLR_ICMS.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vICMS));
  CDS_DADOS_NFEVLR_NFE.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vNF));
  CDS_DADOS_NFEVLR_DESC.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vDesc));
  CDS_DADOS_NFEVLR_PRODUTO.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vProd));
  CDS_DADOS_NFENRO_PEDIDO_COMPRA.AsString:=copy(compra_xPed,1,6);
  CDS_DADOS_NFEVLR_IPI.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vIPI));
  CDS_DADOS_NFEVLR_PIS.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vPIS));
  CDS_DADOS_NFEVLR_COFINS.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vCOFINS));
  CDS_DADOS_NFEBC_ST.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vBCST));
  CDS_DADOS_NFEVLR_ST.AsFloat:=StrToFloat(trocaPontoVirgula(total_ICMSTot_vST));
  CDS_DADOS_NFECNPJ_EMISSOR.AsString:=emit_CNPJ;
  CDS_DADOS_NFE.Post;
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoItem;
  procedure InserirItem(Lote,Dt_Fab,Dt_Venc:string; Qtde_Lote,CountLote:integer);
  var
    Qtde_Produto : Integer;
  begin
    Qtde_Produto:=strtoint(TiraPonto(det_prod_qCom)) div 10000;

    if CDS_DADOS_ITEM.Active = false then
      CDS_DADOS_ITEM.Open;

    CDS_DADOS_ITEM.Append;
    CDS_DADOS_ITEMCOD_PRODUTO.AsString:=det_prod_cProd;
    CDS_DADOS_ITEMEAN_PRODUTO.AsString:=det_prod_cEAN;
    CDS_DADOS_ITEMNOME_PRODUTO.AsString:=det_prod_xProd;
    CDS_DADOS_ITEMUNIDADE_ITEM.AsString:=det_prod_uCom;

    if Qtde_Lote > 0 then
    begin
      if (Qtde_Lote <> Qtde_Produto) and (Qtde_Lote < Qtde_Produto) and ( CountLote > 1 ) then
      begin
        CDS_DADOS_ITEMQTD_PRODUTO.AsInteger:=Qtde_Lote;
        CDS_DADOS_ITEMALERTA_ITEM.AsString:='S';
      end
      else
      begin
        CDS_DADOS_ITEMQTD_PRODUTO.AsInteger:=Qtde_Produto;
        Qtde_Lote:=Qtde_Produto;
        CDS_DADOS_ITEMALERTA_ITEM.AsString:='N';
      end;
    end
    else
    begin
      CDS_DADOS_ITEMQTD_PRODUTO.AsInteger:=Qtde_Produto;
      CDS_DADOS_ITEMALERTA_ITEM.AsString:='N';
    end;


    CDS_DADOS_ITEMNCM.AsString:=det_prod_NCM;
    CDS_DADOS_ITEMVLR_UNIT_PRODUTO.AsFloat:=StrToFloat(trocaPontoVirgula(det_prod_vUnCom));
    CDS_DADOS_ITEMVLR_DESC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_prod_vDesc)));

    CDS_DADOS_ITEMVLR_TOTAL_PRODUTO.AsFloat:=StrToFloat(trocaPontoVirgula(det_prod_vProd));
    CDS_DADOS_ITEMCFOP.AsString:=det_prod_CFOP;

    CDS_DADOS_ITEMICMS_CST.AsString:=det_imposto_ICMS_CST;
    CDS_DADOS_ITEMICMS_BC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_ICMS_vBC)));
    CDS_DADOS_ITEMICMS_PERC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_ICMS_pICMS)));
    CDS_DADOS_ITEMICMS_VLR.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_ICMS_vICMS)));
    CDS_DADOS_ITEMICMS_PC_REDUCAO_BASE_CALCULO.AsFloat:=StrToFloat(ValidaValor(trocaPontoVirgula(det_imposto_ICMS_pRedBCST)));
    CDS_DADOS_ITEMICMS_BCST.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_ICMS_vBCST)));
    CDS_DADOS_ITEMICMS_VLR_BCST.AsFloat:=StrToFloat(ValidaValor(trocaPontoVirgula(det_imposto_ICMS_vICMSST)));

    CDS_DADOS_ITEMIPI_BC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_IPI_vBC)));
    CDS_DADOS_ITEMIPI_PERC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_IPI_pIPI)));
    CDS_DADOS_ITEMIPI_VLR.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_IPI_vIPI)));

    CDS_DADOS_ITEMPIS_BC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_IPI_vBC)));
    CDS_DADOS_ITEMPIS_PERC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_PIS_pPIS)));
    CDS_DADOS_ITEMPIS_VLR.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_PIS_vPIS)));

    CDS_DADOS_ITEMCOFINS_BC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_COFINS_vBC)));
    CDS_DADOS_ITEMCOFINS_PERC.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_COFINS_pCOFINS)));
    CDS_DADOS_ITEMCOFINS_VLR.AsFloat:=StrToFloat(trocaPontoVirgula(ValidaValor(det_imposto_COFINS_vCOFINS)));

    CDS_DADOS_ITEMLOTE_NRO_LOTE.AsString:=Lote;
    CDS_DADOS_ITEMLOTE_QTD_LOTE.AsInteger:=Qtde_Lote;
    CDS_DADOS_ITEMLOTE_FABRICACAO_LOTE.AsString:=Dt_Fab;
    CDS_DADOS_ITEMLOTE_VALIDADE_LOTE.AsString:=Dt_Venc;

    CDS_DADOS_ITEM.Post;
  end;
var
  NRO_LOTE,DT_FABRICACAO,DT_VENCIMENTO : string;
  QTD_LOTE,COUNT_REG : integer;
begin
  COUNT_REG:=CDS_DADOS_LOTE_ITEM.RecordCount;
  if COUNT_REG > 0 then
  begin
    CDS_DADOS_LOTE_ITEM.First;
    while not CDS_DADOS_LOTE_ITEM.Eof do
    begin
      NRO_LOTE:=FormataLote(CDS_DADOS_LOTE_ITEMNRO_LOTE.AsString);
      QTD_LOTE:=strtoint(TiraPonto(CDS_DADOS_LOTE_ITEMQTD_LOTE.AsString)) div 1000;
      DT_FABRICACAO:=FormataData(CDS_DADOS_LOTE_ITEMDT_FABRICACAO.asstring);
      DT_VENCIMENTO:=FormataData(CDS_DADOS_LOTE_ITEMDT_VALIDADE.AsString);
      InserirItem(NRO_LOTE,DT_FABRICACAO,DT_VENCIMENTO,QTD_LOTE,COUNT_REG);
      CDS_DADOS_LOTE_ITEM.Next;
    end;
  end
  else
  begin
    NRO_LOTE:='*';
    QTD_LOTE:=0;
    DT_FABRICACAO:='01/01/2039';
    DT_VENCIMENTO:='01/01/2039';
    InserirItem(NRO_LOTE,DT_FABRICACAO,DT_VENCIMENTO,QTD_LOTE,COUNT_REG);
  end;
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoloteItem;
begin
  if CDS_DADOS_LOTE_ITEM.Active = false then
    CDS_DADOS_LOTE_ITEM.Open;

  CDS_DADOS_LOTE_ITEM.Append;
  CDS_DADOS_LOTE_ITEMNRO_LOTE.AsString:=det_prod_med_nLote;
  CDS_DADOS_LOTE_ITEMQTD_LOTE.AsString:=det_prod_med_qLote;
  CDS_DADOS_LOTE_ITEMDT_FABRICACAO.AsString:=det_prod_med_dFab;
  CDS_DADOS_LOTE_ITEMDT_VALIDADE.AsString:=det_prod_med_dVal;
  CDS_DADOS_LOTE_ITEMVLR_PRECO_CONSUMIDOR.AsString:=det_prod_med_vPMC;
  CDS_DADOS_LOTE_ITEM.Post;
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoTransporte;
begin
  if CDS_DADOS_TRANSPORTE.Active = false then
    CDS_DADOS_TRANSPORTE.Open;

  CDS_DADOS_TRANSPORTE.Append;
  CDS_DADOS_TRANSPORTENOME_TRASPORTADOR.AsString:=transp_transporta_xNome;
  CDS_DADOS_TRANSPORTEQTD_VOLUME.AsInteger:=strtoint(transp_vol_qVol);
  CDS_DADOS_TRANSPORTEPESO_LIQUIDO.AsFloat:=strtofloat(trocaPontoVirgula(transp_vol_pesoL));
  CDS_DADOS_TRANSPORTEPESO_BRUTO.AsFloat:=strtofloat(trocaPontoVirgula(transp_vol_pesoB));
  CDS_DADOS_TRANSPORTEESPECIE_VOLUME.AsString:=transp_vol_esp;
  CDS_DADOS_TRANSPORTE.Post;
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoadicional;
begin
  if CDS_DADOS_ADC.Active = false then
    CDS_DADOS_ADC.Open;

  CDS_DADOS_ADC.Append;
  CDS_DADOS_ADCDS_DADOS_ADC.Value:=infAdic_infCpl;
  CDS_DADOS_ADCDS_DADOS_FISCO.Value:=infAdic_infAdFisco;
  CDS_DADOS_ADC.Post;
end;

procedure T_frmNfeVisualizaDanfe.GravaDadoDuplicata;
begin
  if CDS_DADOS_DUPLICATA.Active = false then
    CDS_DADOS_DUPLICATA.Open;

  CDS_DADOS_DUPLICATA.Append;
  CDS_DADOS_DUPLICATANR_DUPLICATA.AsString:=cobr_dup_nDup;
  CDS_DADOS_DUPLICATAVLR_DUPLICATA.AsString:=trocaPontoVirgula(cobr_dup_vDup);
  CDS_DADOS_DUPLICATADT_VENCIMENTO.AsString:=formataData(cobr_dup_dVenc);
  CDS_DADOS_DUPLICATA.Post;
end;

procedure T_frmNfeVisualizaDanfe.ProcessaXML(nmArquivo:string);
  procedure Tag_Principal(nmArquivo:string);
  var
    NodePai,NodeSec,NodeTmp,NodeTmpNivel1: IXMLNode;
  begin
    XMLDoc.LoadFromFile(nmArquivo);
    NodePai:= XMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
    if NodePai <> nil then
      NodeSec:=NodePai.ChildNodes.FindNode('infNFe')
    else
      NodeSec:=XMLDoc.DocumentElement.ChildNodes.FindNode('infNFe');

    // TAG IDE - DADOS DA NOTA
    NodeTmp:=NodeSec.ChildNodes.FindNode('ide');
    ide_cUF:=NodeTmp.ChildNodes['cUF'].Text;
    ide_cNF:=NodeTmp.ChildNodes['cNF'].Text;
    ide_natOp:=NodeTmp.ChildNodes['natOp'].Text;
    ide_indPag:=NodeTmp.ChildNodes['indPag'].Text;
    ide_mod:=NodeTmp.ChildNodes['mod'].Text;
    ide_serie:=NodeTmp.ChildNodes['serie'].Text;
    ide_nNF:=NodeTmp.ChildNodes['nNF'].Text;
    ide_dEmi:=NodeTmp.ChildNodes['dEmi'].Text;
    ide_dSaiEnt:=NodeTmp.ChildNodes['dSaiEnt'].Text;
    ide_tpNF:=NodeTmp.ChildNodes['tpNF'].Text;
    ide_cMunFG:=NodeTmp.ChildNodes['cMunFG'].Text;
    ide_tpImp:=NodeTmp.ChildNodes['tpImp'].Text;
    ide_tpEmis:=NodeTmp.ChildNodes['tpEmis'].Text;
    ide_cDV:=NodeTmp.ChildNodes['cDV'].Text;
    ide_tpAmb:=NodeTmp.ChildNodes['tpAmb'].Text;
    ide_finNFe:=NodeTmp.ChildNodes['finNFe'].Text;
    ide_procEmi:=NodeTmp.ChildNodes['procEmi'].Text;
    ide_verProc:=NodeTmp.ChildNodes['verProc'].Text;

    // TAG EMIT - DADOS DO EMITENTE
    NodeTmp:=NodeSec.ChildNodes.FindNode('emit');
    emit_CNPJ:=NodeTmp.ChildNodes['CNPJ'].Text;
    emit_xNome:=NodeTmp.ChildNodes['xNome'].Text;
    emit_xFant:=NodeTmp.ChildNodes['xFant'].Text;
    NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('enderEmit');
    emit_enderemit_xLgr:=NodeTmpNivel1.ChildNodes['xLgr'].Text;
    emit_enderemit_nro:=NodeTmpNivel1.ChildNodes['nro'].Text;
    emit_enderemit_xCpl:=NodeTmpNivel1.ChildNodes['xCpl'].Text;
    emit_enderemit_xBairro:=NodeTmpNivel1.ChildNodes['xBairro'].Text;
    emit_enderemit_cMun:=NodeTmpNivel1.ChildNodes['cMun'].Text;
    emit_enderemit_xMun:=NodeTmpNivel1.ChildNodes['xMun'].Text;
    emit_enderemit_UF:=NodeTmpNivel1.ChildNodes['UF'].Text;
    emit_enderemit_CEP:=NodeTmpNivel1.ChildNodes['CEP'].Text;
    emit_enderemit_cPais:=NodeTmpNivel1.ChildNodes['cPais'].Text;
    emit_enderemit_xPais:=NodeTmpNivel1.ChildNodes['xPais'].Text;
    emit_enderemit_fone:=NodeTmpNivel1.ChildNodes['fone'].Text;
    emit_IE:=NodeTmp.ChildNodes['IE'].Text;

    // TAG DEST - DADOS DO DESTINATARIO
    NodeTmp:=NodeSec.ChildNodes.FindNode('dest');
    dest_CNPJ:=NodeTmp.ChildNodes['CNPJ'].Text;
    dest_xNome:=NodeTmp.ChildNodes['xNome'].Text;
    NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('enderDest');
    dest_enderDest_xLgr:=NodeTmpNivel1.ChildNodes['xLgr'].Text;
    dest_enderDest_nro:=NodeTmpNivel1.ChildNodes['nro'].Text;
    dest_enderDest_xBairro:=NodeTmpNivel1.ChildNodes['xBairro'].Text;
    dest_enderDest_cMun:=NodeTmpNivel1.ChildNodes['cMun'].Text;
    dest_enderDest_xMun:=NodeTmpNivel1.ChildNodes['xMun'].Text;
    dest_enderDest_UF:=NodeTmpNivel1.ChildNodes['UF'].Text;
    dest_enderDest_CEP:=NodeTmpNivel1.ChildNodes['CEP'].Text;
    dest_enderDest_cPais:=NodeTmpNivel1.ChildNodes['cPais'].Text;
    dest_enderDest_xPais:=NodeTmpNivel1.ChildNodes['xPais'].Text;
    dest_IE:=NodeTmp.ChildNodes['IE'].Text;

    // TAG TOTAL - DADOS DOS TOTALIZADORES DA NOTA
    NodeTmp:=NodeSec.ChildNodes.FindNode('total');
    NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('ICMSTot');
    total_ICMSTot_vBC:=NodeTmpNivel1.ChildNodes['vBC'].Text;
    total_ICMSTot_vICMS:=NodeTmpNivel1.ChildNodes['vICMS'].Text;
    total_ICMSTot_vBCST:=NodeTmpNivel1.ChildNodes['vBCST'].Text;
    total_ICMSTot_vST:=NodeTmpNivel1.ChildNodes['vST'].Text;
    total_ICMSTot_vProd:=NodeTmpNivel1.ChildNodes['vProd'].Text;
    total_ICMSTot_vFrete:=NodeTmpNivel1.ChildNodes['vFrete'].Text;
    total_ICMSTot_vSeg:=NodeTmpNivel1.ChildNodes['vSeg'].Text;
    total_ICMSTot_vDesc:=NodeTmpNivel1.ChildNodes['vDesc'].Text;
    total_ICMSTot_vII:=NodeTmpNivel1.ChildNodes['vII'].Text;
    total_ICMSTot_vIPI:=NodeTmpNivel1.ChildNodes['vIPI'].Text;
    total_ICMSTot_vPIS:=NodeTmpNivel1.ChildNodes['vPIS'].Text;
    total_ICMSTot_vCOFINS:=NodeTmpNivel1.ChildNodes['vCOFINS'].Text;
    total_ICMSTot_vOutro:=NodeTmpNivel1.ChildNodes['vOutro'].Text;
    total_ICMSTot_vNF:=NodeTmpNivel1.ChildNodes['vNF'].Text;

    // TAG COMPRA - DADOS DO PEDIDO DE COMPRA DO DESTINATARIO
    NodeTmp:=NodeSec.ChildNodes.FindNode('compra');
    if NodeTmp <> nil then
      compra_xPed:=NodeTmp.ChildNodes['xPed'].Text;

    GravaDadoPrincipal;
  end;

  procedure Tag_transporte(nmArquivo:string);
  var
    NodePai,NodeSec,NodeTmp,NodeTmpNivel1: IXMLNode;
  begin
    // TAG TRANSP - DADOS DO TRANSPORTE
    XMLDoc.LoadFromFile(nmArquivo);
    NodePai:= XMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
    if NodePai <> nil then
      NodeSec:=NodePai.ChildNodes.FindNode('infNFe')
    else
      NodeSec:=XMLDoc.DocumentElement.ChildNodes.FindNode('infNFe');

    NodeTmp:=NodeSec.ChildNodes.FindNode('transp');
    transp_modFrete:=NodeTmp.ChildNodes['modFrete'].Text;

    // DADOS DA TRANSPORTADORA
    NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('transporta');
    if NodeTmpNivel1 <> nil then
    begin
      transp_transporta_CNPJ:=NodeTmpNivel1.ChildNodes['CNPJ'].Text;
      transp_transporta_xNome:=NodeTmpNivel1.ChildNodes['xNome'].Text;
      transp_transporta_IE:=NodeTmpNivel1.ChildNodes['IE'].Text;
      transp_transporta_xEnder:=NodeTmpNivel1.ChildNodes['xEnder'].Text;
      transp_transporta_xMun:=NodeTmpNivel1.ChildNodes['xMun'].Text;
      transp_transporta_UF:=NodeTmpNivel1.ChildNodes['UF'].Text;
    end;

    // DADOS DO VOLUME
    NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('vol');
    if NodeTmpNivel1 <> nil then
    begin
      transp_vol_qVol:=ValidaValor(NodeTmpNivel1.ChildNodes['qVol'].Text);
      transp_vol_esp:=ValidaValor(NodeTmpNivel1.ChildNodes['esp'].Text);
      transp_vol_pesoL:=ValidaValor(NodeTmpNivel1.ChildNodes['pesoL'].Text);
      transp_vol_pesoB:=ValidaValor(NodeTmpNivel1.ChildNodes['pesoB'].Text);
    end
    else
    begin
      transp_vol_qVol:='0';
      transp_vol_esp:='';
      transp_vol_pesoL:='0';
      transp_vol_pesoB:='0';
    end;

    GravaDadoTransporte;
  end;

  procedure Tag_det(nmArquivo:string);
  var
    NodePai,NodeSec,NodeTmp,NodeTmpNivel1,NodeTmpNivel2,NodeTmpNivel3: IXMLNode;
    vlr_temp,vlr_tmpnivel1,vlr_tempnivel2,vlr_tempnivel3 : string;
  begin
    XMLDoc.LoadFromFile(nmArquivo);
    NodePai:= XMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
    if NodePai <> nil then
      NodeSec:=NodePai.ChildNodes.FindNode('infNFe')
    else
      NodeSec:=XMLDoc.DocumentElement.ChildNodes.FindNode('infNFe');

    // TAG DET - DADOS DE DETALHE DO PRODUTO
    NodeTmp:=NodeSec.ChildNodes.FindNode('det');
    Nodetmp.ChildNodes.First;
    vlr_temp:=NodeTmp.NodeName;
    while NodeTmp <> nil do
    begin
      NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('prod');
      if NodeTmpNivel1 <> nil then
      begin
        if NodeTmpNivel1.NodeName = 'prod' then
        begin
          vlr_tmpnivel1:=NodeTmpNivel1.NodeName;
          det_prod_cProd:=TiraPonto(NodeTmpNivel1.ChildNodes['cProd'].text);
          det_prod_cEAN:=NodeTmpNivel1.ChildNodes['cEAN'].text;
          det_prod_xProd:=UpperCase(NodeTmpNivel1.ChildNodes['xProd'].text);
          det_prod_NCM:=NodeTmpNivel1.ChildNodes['NCM'].text;
          det_prod_CFOP:=NodeTmpNivel1.ChildNodes['CFOP'].text;
          det_prod_uCom:=NodeTmpNivel1.ChildNodes['uCom'].text;
          det_prod_qCom:=FormataTagQtdProduto(NodeTmpNivel1.ChildNodes['qCom'].text);
          det_prod_vUnCom:=NodeTmpNivel1.ChildNodes['vUnCom'].text;
          det_prod_vProd:=NodeTmpNivel1.ChildNodes['vProd'].text;
          det_prod_cEANTrib:=NodeTmpNivel1.ChildNodes['cEANTrib'].text;
          det_prod_uTrib:=NodeTmpNivel1.ChildNodes['uTrib'].text;
          det_prod_qTrib:=NodeTmpNivel1.ChildNodes['qTrib'].text;
          det_prod_vUnTrib:=NodeTmpNivel1.ChildNodes['vUnTrib'].text;
          det_prod_vDesc:=NodeTmpNivel1.ChildNodes['vDesc'].text;

          // LOTE DA MERCADORIA
          CDS_DADOS_LOTE_ITEM.Close;
          CDS_DADOS_LOTE_ITEM.CreateDataSet;
          NodeTmpNivel2:=NodeTmpNivel1.ChildNodes.FindNode('med');
          if NodeTmpNivel2 <> nil then
          begin
            NodeTmpNivel2.ChildNodes.First;
            while NodeTmpNivel2 <> nil do
            begin
              if NodeTmpNivel2.NodeName = 'med' then
              begin
                vlr_tempnivel2:=NodeTmpNivel2.NodeName;
                det_prod_med_nLote:=NodeTmpNivel2.ChildNodes['nLote'].text;
                det_prod_med_qLote:=NodeTmpNivel2.ChildNodes['qLote'].text;
                det_prod_med_dFab:=NodeTmpNivel2.ChildNodes['dFab'].text;
                det_prod_med_dVal:=NodeTmpNivel2.ChildNodes['dVal'].text;
                det_prod_med_vPMC:=NodeTmpNivel2.ChildNodes['vPMC'].text;
                GravaDadoloteItem;
              end;
              NodeTmpNivel2:=NodeTmpNivel2.NextSibling;
            end;
          end;

          // IMPOSTOS
          NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('imposto');
          vlr_tmpnivel1:=NodeTmpNivel1.NodeName;
          // ICMS
          NodeTmpNivel2:=NodeTmpNivel1.ChildNodes.FindNode('ICMS');
          if NodeTmpNivel2 <> nil then
          begin
            vlr_tempnivel2:=NodeTmpNivel2.NodeName;
            NodeTmpNivel3:=NodeTmpNivel2.ChildNodes.Get(0);
            vlr_tempnivel3:=NodeTmpNivel3.NodeName;
            det_imposto_ICMS_orig:=NodeTmpNivel3.ChildNodes['orig'].Text;
            det_imposto_ICMS_CST:=NodeTmpNivel3.ChildNodes['CST'].Text;
            det_imposto_ICMS_modBC:=NodeTmpNivel3.ChildNodes['modBC'].Text;
            det_imposto_ICMS_vBC:=NodeTmpNivel3.ChildNodes['vBC'].Text;
            det_imposto_ICMS_pICMS:=NodeTmpNivel3.ChildNodes['pICMS'].Text;
            det_imposto_ICMS_vICMS:=NodeTmpNivel3.ChildNodes['vICMS'].Text;

            det_imposto_ICMS_modBCST:=NodeTmpNivel3.ChildNodes['modBCST'].Text;
            det_imposto_ICMS_pMVAST:=NodeTmpNivel3.ChildNodes['pMVAST'].Text;
            det_imposto_ICMS_pRedBCST:=NodeTmpNivel3.ChildNodes['pRedBCST'].Text;
            det_imposto_ICMS_vBCST:=NodeTmpNivel3.ChildNodes['vBCST'].Text;
            det_imposto_ICMS_pICMSST:=NodeTmpNivel3.ChildNodes['pICMSST'].Text;    // PC_BASE_CALCULO_ST
            det_imposto_ICMS_vICMSST:=NodeTmpNivel3.ChildNodes['vICMSST'].Text;    // VLR_BASE_CALCULO_ST
            det_imposto_ICMS_pRedBC:=NodeTmpNivel3.ChildNodes['pRedBC'].Text;
          end;

          // IPI
          NodeTmpNivel2:=NodeTmpNivel1.ChildNodes.FindNode('IPI');
          if NodeTmpNivel2 <> nil then
          begin
            vlr_tempnivel2:=NodeTmpNivel2.NodeName;
            det_imposto_IPI_cEnq:=NodeTmpNivel2.ChildNodes['cEnq'].Text;
            NodeTmpNivel3:=NodeTmpNivel2.ChildNodes.FindNode('IPITrib');
            if NodeTmpNivel3 <> nil then
            begin
              vlr_tempnivel3:=NodeTmpNivel3.NodeName;
              det_imposto_IPI_CST:=NodeTmpNivel3.ChildNodes['CST'].Text;
              det_imposto_IPI_vBC:=NodeTmpNivel3.ChildNodes['vBC'].Text;
              det_imposto_IPI_pIPI:=NodeTmpNivel3.ChildNodes['pIPI'].Text;
              det_imposto_IPI_vIPI:=NodeTmpNivel3.ChildNodes['vIPI'].Text;
            end
            else
            begin
              NodeTmpNivel3:=NodeTmpNivel2.ChildNodes.FindNode('IPINT');
              vlr_tempnivel3:=NodeTmpNivel3.NodeName;
              det_imposto_IPI_CST:=NodeTmpNivel3.ChildNodes['CST'].Text;
            end;
          end;

          // PIS
          NodeTmpNivel2:=NodeTmpNivel1.ChildNodes.FindNode('PIS');
          if NodeTmpNivel2 <> nil then
          begin
            vlr_tempnivel2:=NodeTmpNivel2.NodeName;
            NodeTmpNivel3:=NodeTmpNivel2.ChildNodes.Get(0);
            if NodeTmpNivel3 <> nil then
            begin
              vlr_tempnivel3:=NodeTmpNivel3.NodeName;
              det_imposto_PIS_CST:=NodeTmpNivel3.ChildNodes['CST'].Text;
              det_imposto_PIS_vBC:=NodeTmpNivel3.ChildNodes['vBC'].Text;
              det_imposto_PIS_pPIS:=NodeTmpNivel3.ChildNodes['pPIS'].Text;
              det_imposto_PIS_vPIS:=NodeTmpNivel3.ChildNodes['vPIS'].Text;
              det_imposto_PIS_qBCProd:=NodeTmpNivel3.ChildNodes['qBCprod'].Text;
              det_imposto_PIS_vAliqProd:=NodeTmpNivel3.ChildNodes['vAliqProd'].Text;
            end;
          end;

          // COFINS
          NodeTmpNivel2:=NodeTmpNivel1.ChildNodes.FindNode('COFINS');
          if NodeTmpNivel2 <> nil then
          begin
            vlr_tempnivel2:=NodeTmpNivel2.NodeName;
            NodeTmpNivel3:=NodeTmpNivel2.ChildNodes.Get(0);
            if NodeTmpNivel3 <> nil then
            begin
              vlr_tempnivel3:=NodeTmpNivel3.NodeName;
              det_imposto_COFINS_CST:=NodeTmpNivel3.ChildNodes['CST'].Text;
              det_imposto_COFINS_vBC:=NodeTmpNivel3.ChildNodes['vBC'].Text;
              det_imposto_COFINS_pCOFINS:=NodeTmpNivel3.ChildNodes['pCOFINS'].Text;
              det_imposto_COFINS_vCOFINS:=NodeTmpNivel3.ChildNodes['vCOFINS'].Text;
              det_imposto_COFINS_qBCProd:=NodeTmpNivel3.ChildNodes['qBCprod'].Text;
              det_imposto_COFINS_vAliqProd:=NodeTmpNivel3.ChildNodes['vAliqProd'].Text;
            end;
          end;
          GravaDadoItem;
        end;
      end;
      NodeTmp:=NodeTmp.NextSibling;
    end;
  end;

  procedure Tag_cobr(nmArquivo:string);
  var
    NodePai,NodeSec,NodeTmp,NodeTmpNivel1: IXMLNode;
  begin
    XMLDoc.LoadFromFile(nmArquivo);
    NodePai:= XMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
    if NodePai <> nil then
      NodeSec:=NodePai.ChildNodes.FindNode('infNFe')
    else
      NodeSec:=XMLDoc.DocumentElement.ChildNodes.FindNode('infNFe');

    // TAG COBR - DADOS DA COBRAN?A
    NodeTmp:=NodeSec.ChildNodes.FindNode('cobr');
    if NodeTmp <> nil then
    begin
      NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('fat');
      if NodeTmpNivel1 <> nil then
      begin
        cobr_fat_nFat:=NodeTmpNivel1.ChildNodes['nFat'].Text;
        cobr_fat_VOrig:=NodeTmpNivel1.ChildNodes['vOrig'].Text;
        cobr_fat_vDesc:=NodeTmpNivel1.ChildNodes['vDesc'].Text;
        cobr_fat_vLiq:=NodeTmpNivel1.ChildNodes['vLiq'].Text;
      end;

      NodeTmpNivel1:=NodeTmp.ChildNodes.FindNode('dup');
      if NodeTmpNivel1 <> nil then
      begin
        while NodeTmpNivel1 <> nil do
        begin
          cobr_dup_nDup:=NodeTmpNivel1.ChildNodes['nDup'].Text;
          cobr_dup_dVenc:=NodeTmpNivel1.ChildNodes['dVenc'].Text;
          cobr_dup_vDup:=NodeTmpNivel1.ChildNodes['vDup'].Text;
          GravaDadoDuplicata;
          NodeTmpNivel1:=NodeTmpNivel1.NextSibling;
        end;
      end;
    end;
  end;

  procedure Tag_dadoAdicional(nmArquivo:string);
  var
    NodePai,NodeSec,NodeTmp: IXMLNode;
  begin
    XMLDoc.LoadFromFile(nmArquivo);
    NodePai:= XMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
    if NodePai <> nil then
      NodeSec:=NodePai.ChildNodes.FindNode('infNFe')
    else
      NodeSec:=XMLDoc.DocumentElement.ChildNodes.FindNode('infNFe');

    // TAG INFADIC - DADOS INFORMA??ES ADICIONAIS
    NodeTmp:=NodeSec.ChildNodes.FindNode('infAdic');
    if NodeTmp <> nil then
    begin
      infAdic_infCpl:=NodeTmp.ChildNodes['infCpl'].Text;
      infAdic_infAdFisco:=NodeTmp.ChildNodes['infAdFisco'].Text;
      GravaDadoadicional;
    end;  
  end;

begin
  Tag_Principal(nmArquivo);
  Tag_det(nmArquivo);
  Tag_cobr(nmArquivo);
  Tag_transporte(nmArquivo);
  Tag_dadoAdicional(nmArquivo);
end;

procedure T_frmNfeVisualizaDanfe.CriaDataSet;
begin
  // CRIA DATA SET LOCAL
  CDS_DADOS_NFE.Close;
  CDS_DADOS_NFE.CreateDataSet;
  CDS_DADOS_ITEM.Close;
  CDS_DADOS_ITEM.CreateDataSet;
  CDS_DADOS_LOTE_ITEM.Close;
  CDS_DADOS_LOTE_ITEM.CreateDataSet;
  CDS_DADOS_ADC.Close;
  CDS_DADOS_ADC.CreateDataSet;
  CDS_DADOS_DUPLICATA.Close;
  CDS_DADOS_DUPLICATA.CreateDataSet;
  CDS_DADOS_TRANSPORTE.Close;
  CDS_DADOS_TRANSPORTE.CreateDataSet;
end;

procedure T_frmNfeVisualizaDanfe.CarregaDadosDANFE;
begin
  try
    if qryconsulta_GED.RecordCount > 0 then
    begin
      NRO_PEDIDO_COMPRA:='0';
      CriaDataSet;
      Mem_rec_XML.Clear;
      Mem_rec_XML.Text:=AnsiToUtf8(qry_consulta_GEDDS_NFE_XML.Value);
      DeleteFile(ExtractFilePath(Application.ExeName) + NM_ARQUIVO_XML);
      Mem_rec_XML.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + NM_ARQUIVO_XML);

      // L? O XML E CRIA DATASET COM AS INFORMA??ES
      ProcessaXML(ExtractFilePath(Application.ExeName) + NM_ARQUIVO_XML);
      CDS_DADOS_ITEM.First;
      CDS_DADOS_DUPLICATA.First;

      // DADOS PRINCIPAIS DA NF
      EdDtEmissao.Text:=qry_consulta_GEDDT_EMISSAO.AsString;
      EdRazaoSocial.Text:=qry_consulta_GEDNOMP_P.AsString;
      EdNroNF.Text:=formataValorNumerico(CDS_DADOS_NFENRO_NFE.AsString);
      EdtQtdItem.Text:=formataValorNumerico(inttostr(CDS_DADOS_ITEM.RecordCount));
      EdValorItem.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_PRODUTO.AsFloat));
      EdValorDesc.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_DESC.Asfloat));
      EdTotalNF.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_NFE.AsFloat));
      EdSerie.Text:=formataValorNumerico(CDS_DADOS_NFESERIE_NFE.AsString);
      NRO_PEDIDO_COMPRA:=qry_consulta_GEDNR_PEDIDO_COMPRA.AsString;

      // DADOS DOS IMPOSTOS
      EdBaseICMS.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEBC_ICMS.AsFloat));
      EdVlrICMS.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_ICMS.AsFloat));
      EdBaseST.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEBC_ST.AsFloat));
      EdVlrST.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_ST.AsFloat));
      EdVlrIPI.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_IPI.AsFloat));
      EdVlrPIS.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_PIS.AsFloat));
      EdVlrCOFINS.Text:=formataValorNumerico(FormatFloat('###,##0.00',CDS_DADOS_NFEVLR_COFINS.AsFloat));

      // DADOS DE TRANSPORTE
      EdTransportador.Text:=UpperCase(CDS_DADOS_TRANSPORTENOME_TRASPORTADOR.AsString);
      EdEspecie.Text:=UpperCase(CDS_DADOS_TRANSPORTEESPECIE_VOLUME.AsString);
      EdQtdVolume.Text:=formataValorNumerico(CDS_DADOS_TRANSPORTEQTD_VOLUME.AsString);
      EdPesoLiquido.text:=formataValorNumerico(FormatFloat('###,###0.000',CDS_DADOS_TRANSPORTEPESO_LIQUIDO.AsFloat));
      EdPesoBruto.text:=formataValorNumerico(FormatFloat('###,###0.000',CDS_DADOS_TRANSPORTEPESO_BRUTO.AsFloat));

      // DADOS ADICIONAIS
      mmDadosAdc.Text:=CDS_DADOS_ADCDS_DADOS_ADC.AsString + ' '+ CDS_DADOS_ADCDS_DADOS_FISCO.AsString;
      DBGridItemNota.SetFocus;

      if DS_REFERENCIA_ITEM <> '*' then
      begin
        while not CDS_DADOS_ITEM.Eof do
        begin
          if CDS_DADOS_ITEMCOD_PRODUTO.AsString = DS_REFERENCIA_ITEM then
            break;
          CDS_DADOS_ITEM.Next;
        end;
      end;
    end;
  finally
    DS_REFERENCIA_ITEM:='';
  end;
end;

procedure T_frmNfeVisualizaDanfe.ListaXML_GED(dsChave:string);
var
  sql : string;
begin
  sql:='SELECT CD_FORNECEDOR, NOMP_P, DT_EMISSAO, A.DT_ATUALIZACAO DT_ATUALIZACAO,NM_COMPRADOR_REDUZIDO, DS_NFE_CHAVE,NR_NFE, CGCP_P, REPP_F,A.NR_PEDIDO_COMPRA,UTL_COMPRESS.LZ_UNCOMPRESS(A.DS_NFE_XML) DS_NFE_XML '+
       'FROM PRDDM.DC_NFE_COMPRA_GED A,PRDDM.DCPES,PRDDM.DCFOR,PRDDM.DCLAB,PRDDM.DC_COMPRADOR_GAM '+
       'WHERE CGCP_P = NR_CNPJ_EMITENTE ' +
       'AND NROF_F = CD_FORNECEDOR '+
       'AND LABF_F = NROL_L '+
       'AND COML_L = NR_COMPRADOR '+
       'AND A.DS_NFE_CHAVE = '+ QuotedStr(dschave) +
       'ORDER BY DT_ATUALIZACAO,NOMP_P ';

  qry_consulta_GED.Close;
  qry_consulta_GED.CommandText:='';
  qry_consulta_GED.CommandText:=sql;
  qry_consulta_GED.Open;
end;

procedure T_frmNfeVisualizaDanfe.ConsultaChaveNF(dsChaveNFe:string);
begin
  try
    Screen.Cursor:=crSQLWait;
    try
      DeleteFile(ExtractFilePath(Application.ExeName) + NM_ARQUIVO_XML);
      ListaXML_GED(trim(dsChaveNFe));
      if qry_consulta_GED.RecordCount > 0 then
      begin
        CarregaDadosDANFE;
      end
      else
        Application.MessageBox('CHAVE DE ACESSO N?O LOCALIZADA','ATEN??O',MB_ICONWARNING);
    except
      on E:Exception do
        raise Exception.Create('ERRO AO CONSULTAR CHAVE DA NFe');
    end;
  finally
    Screen.Cursor:=crDefault;
  end;

end;


procedure T_frmNfeVisualizaDanfe.FormShow(Sender: TObject);
begin
  mmDadosAdc.Clear;
  if formexiste(_frRelacaoNFeRecebida) = true then
    NRO_CHAVE_NFE:=_frRelacaoNFeRecebida.CDSConsultaGEDDS_NFE_CHAVE.AsString
  else
  begin
    NRO_CHAVE_NFE:=_frVisualizaCriticaNFe.NRO_CHAVE_NFE;
    DS_REFERENCIA_ITEM:=_frVisualizaCriticaNFe.CDSItemCriticaDS_REFERENCIA_ITEM_NF.AsString;
  end;

  ConsultaChaveNF(NRO_CHAVE_NFE);
end;

procedure T_frmNfeVisualizaDanfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frVisualizaDanfe:=nil;
  Action:=cafree;
end;

procedure T_frmNfeVisualizaDanfe.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure T_frmNfeVisualizaDanfe.GerarPlanilha1Click(Sender: TObject);
begin
  GeraPlanilhaItemDANFE;
end;

procedure T_frmNfeVisualizaDanfe.DBGridItemNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure T_frmNfeVisualizaDanfe.Button1Click(Sender: TObject);
begin
  GeraPlanilhaItemDANFE;
end;

procedure T_frmNfeVisualizaDanfe.GERARPLANILHAEXCEL1Click(Sender: TObject);
begin
  GeraPlanilhaItemDANFE;
end;

end.
