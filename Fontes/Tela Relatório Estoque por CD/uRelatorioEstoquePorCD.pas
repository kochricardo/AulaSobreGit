unit uRelatorioEstoquePorCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, DB, DBClient, Buttons,sqlExpr,shellapi;

type
  T_frmRelatorioEstoquePorCD = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    _cdsDetalheEstoque: TClientDataSet;
    _dsDetalheEstoque: TDataSource;
    _dbgDetalhe: TDBGrid;
    BitBtn1: TBitBtn;
    _chkMotraItens: TCheckBox;
    _cobComprador: TComboBox;
    Label1: TLabel;
    _cbxOpcaoCDs: TComboBox;
    Label2: TLabel;
    _chkDetalhefornecedor: TCheckBox;
    _btnExceEstoque: TBitBtn;
    _chkDetalheCD: TCheckBox;
    _chkDetalheComprador: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _dbgDetalheTitleClick(Column: TColumn);
    procedure _btnExceEstoqueClick(Sender: TObject);
  private
    procedure AbreTabelaEstoqueComprador(PnrComprador, PnrFornecedor,
      PcdOPeracaoRede, PnrCd: Integer);
    procedure SetGridDetalhe(PnrComprador,
                             PnrFornecedor,
                             PcdOPeracaoRede,
                             PnrCd:Integer);



    function CarregaCompradores(PnrComprador: Integer): Boolean;
    procedure CarregaCD;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmRelatorioEstoquePorCD: T_frmRelatorioEstoquePorCD;

implementation

uses uDm, uRotinasGenericas;

{$R *.dfm}


procedure T_frmRelatorioEstoquePorCD.AbreTabelaEstoqueComprador(PnrComprador,
                                                          PnrFornecedor,
                                                          PcdOPeracaoRede,
                                                          PnrCd:Integer);
var
 stQuery :TStringList;
 nrCd,nrProduto :Integer;

begin
 try
  //nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);
//  nrProduto:= StrToIntDef(copy(formatfloat('00000000',PcdProduto),1,7),0);
   stQuery:=TStringList.Create;
   with stQuery do
   begin

    add('SELECT');
    if _chkDetalheCD.Checked then
    begin
     add('nm_empresa');
     add(',id_unidade_federacao');
     add(',EMP.cd_empresa,');

    end;
    if _chkDetalheComprador.Checked then
    begin
      add('cd_comprador');
      add(',nm_comprador,');
    end;


    if (_chkDetalhefornecedor.Checked) and (not _chkMotraItens.Checked) then
        add('CM.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR,');

    add('COUNT(*) AS NR_ITENS,');
    if _chkMotraItens.Checked then
    begin
    add('CM.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR');
    add(',ME.CD_MERCADORIA*10+ME.NR_DV_MERCADORIA AS CD_PRODUTO');
    add(',NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
    //add(',(EM.QT_FISICO - QT_RESERVADO- QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE');
    add(',(EM.QT_FISICO) AS QT_ESTOQUE');
    end
    else
     add('sum(EM.QT_FISICO ) AS QT_ESTOQUE');
     // add(',sum(EM.QT_FISICO - QT_RESERVADO- QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE');



    add(',Sum(VT_CUSTO_FINANCEIRO_MERCADORIA) AS  VT_ESTOQUE_CUSTO');
//    add(',Sum(Nvl((EM.QT_FISICO - QT_RESERVADO- QT_RESERVA_PROBLEMATICA - QT_VENCIDO)*VL_UNITARIO_COMPRA,0))  AS VT_ESTOQUE_COMPRA');
    add(',Sum(Nvl((EM.QT_FISICO )*VL_UNITARIO_COMPRA,0))  AS VT_ESTOQUE_COMPRA');
    add(',Sum(Nvl(QT_PENDENTE,0)) AS QT_PENDENTE');
    add(',Sum(Nvl(nr_itens,0)) AS NR_ITENS_PENDENTE');
    add(',Sum(Nvl(VT_PENDENCIA_FABRICA,0)) AS VT_PENDENCIA_FABRICA');
    add(',Sum(Nvl(qt_crossdocking,0)) AS QT_CROSSDOCKING');
    add(',Sum(Nvl(QT_TRANSITO,0)) AS QT_TRANSITO');
    add(',Sum(Nvl(VT_QT_TRANSITO_FABRICA,0)) AS VT_QT_TRANSITO_FABRICA');
    add(',Sum(Nvl(VT_QT_TRANSITO_CUSTO,0)) AS VT_QT_TRANSITO_CUSTO');
    add('');
    add('FROM');
    add('ACESSO.DC_EMPRESA EMP');
    add('JOIN PRDDM.DC_MERCADORIA ME on ME.ID_SITUACAO_MERCADORIA=''A''');
    add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA EM ON EM.CD_EMPRESA=EMP.CD_EMPRESA AND EM.ID_SITUACAO_MERCADORIA=''A'' AND ME.CD_MERCADORIA=EM.CD_MERCADORIA');
    add('');
    add('JOIN PRDDM.DC_COMPRA_MERCADORIA CM ON EM.CD_EMPRESA=CM.CD_EMPRESA AND CM.ID_SITUACAO_MERCADORIA=''A'' AND');
    add('                                       EM.CD_MERCADORIA=CM.CD_MERCADORIA AND CM.CD_GRUPO_FORNECEDOR NOT IN(98,700,755,373,748)');
    add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FIN ON FIN.CD_EMPRESA=CM.CD_EMPRESA AND  FIN.CD_MERCADORIA=CM.CD_MERCADORIA');
    add('JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR');
    add('JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR ON COMPRADOR.NR_COMPRADOR=CM.CD_COMPRADOR');
    add('LEFT OUTER JOIN (SELECT  CM.CD_EMPRESA, CM.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA');
    add('                       FROM');
    add('                       PRDDM.DC_COMPRA_MERCADORIA CM');
    add('                       JOIN PRDDM.DC_LISTA_PRECO_FORNECEDOR LP ON  LP.CD_EMPRESA = CM.CD_EMPRESA AND');
    add('                                                        LP.CD_MERCADORIA=CM.CD_MERCADORIA AND');
    add('                                                        LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
    add('                                                                               FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
    add('                                                                               WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
    add('                                                                               AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
    add('                                                                               AND LPF.DT_MUDANCA_PRECO <= SYSDATE)) LISTA ON LISTA.CD_EMPRESA=CM.CD_EMPRESA AND');
    add('                                                                                                                              LISTA.CD_MERCADORIA=CM.CD_MERCADORIA');
    add('');
    add('');
    add('LEFT OUTER JOIN (SELECT');
    add('Sum(QT_PENDENTE) AS QT_PENDENTE ,');
    add('Sum(QT_TRANSITO) AS QT_TRANSITO,');
    add('Sum(VT_PENDENCIAFABRICA) AS VT_PENDENCIA_FABRICA,');
    add('Sum(VTPENDENCIACUSTO) AS VTPENDENCIACUSTO,');
    add('Sum(VT_QT_TRANSITO_FABRICA) AS VT_QT_TRANSITO_FABRICA,');
    add('Sum(VT_QT_TRANSITO_CUSTO) AS VT_QT_TRANSITO_CUSTO,');
    add('CD_EMPRESA_DESTINO,NROM_Y,Sum(NR_ITENS) AS NR_ITENS');
    add('FROM(');

    add('(SELECT   NROM_Y,Count(*) AS NR_ITENS,');
    add('');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''N'',''P'')  THEN  NVL(SUM(QUAY_Y  - CHEY_Y),0)');
    add('                   ELSE 0');
    add('                END QT_PENDENTE,');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''T'')  THEN  NVL(SUM(QUAY_Y  - CHEY_Y),0)');
    add('                   ELSE 0');
    add('                END QT_TRANSITO,');
    add('');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''N'',''P'')  THEN   NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0)');
    add('                   ELSE 0');
    add('                END  VT_PENDENCIAFABRICA,');
    add('');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''N'',''P'')  THEN  NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0)');
    add('                   ELSE 0');
    add('                END  VTPENDENCIACUSTO,');
    add('');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''T'')  THEN  NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0)');
    add('                   ELSE 0');
    add('                END VT_QT_TRANSITO_FABRICA,');
    add('');
    add('                CASE');
    add('                   WHEN  SITY_Y IN(''T'')  THEN NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0)');
    add('');
    add('                   ELSE 0');
    add('                END VT_QT_TRANSITO_CUSTO,');
    add('');
    add('');
    add('                LABP_P ,CD_EMPRESA_DESTINO');
    add('            FROM');
    add('            PRDDM.DCPCC CAPA,');
    add('            PRDDM.DCPCI ITEM');
    add('            WHERE');
    add('            NROP_P=NROP_Y');
    add('            AND ITEM.CD_EMPRESA=CAPA.CD_EMPRESA');
    add('            AND SITP_P IN(''N'',''P'',''T'')');
    add('            AND SITY_Y IN(''N'',''P'',''T'')');
    add('            AND item.cd_operacao_rede in(0,1)');
    add('          GROUP BY NROM_Y,LABP_P ,CD_EMPRESA_DESTINO,SITY_Y))');
    add('           GROUP BY CD_EMPRESA_DESTINO,NROM_Y) PENDENCIA  ON PENDENCIA.NROM_Y=EM.CD_MERCADORIA AND CD_EMPRESA_DESTINO=EM.CD_EMPRESA AND  CD_EMPRESA_DESTINO=cM.CD_EMPRESA');
    add('');
    add('WHERE');
    add('');
    add('     id_empresa_fisica=''S''');
    add(' AND id_situacao_empresa=''A''');
    if PcdOPeracaoRede>0 then
    add('and EMP.cd_empresa=:PnrCD');
     add('and cd_comprador not in(0,5,20,21)');
    if PnrComprador>0 then
     add('and cd_comprador=:PnrComprador');


  //  add('-- AND CM.cd_empresa IN(1)');
  //  add('-- AND qt_transito>0');
//    add('-- AND cm.cd_mercadoria=38727');
    //add(' AND CM.cd_grupo_fornecedor=204');
    add('');
    if (_chkMotraItens.Checked) or (_chkDetalhefornecedor.Checked) or
       (_chkDetalheCD.Checked) or  (_chkDetalheComprador.Checked)  then
      add(' GROUP BY');
    if _chkDetalheCD.Checked then
    begin

      add(' nm_empresa,');
      add(' id_unidade_federacao');
      add(' ,EMP.cd_empresa');
      if (_chkMotraItens.Checked) OR (_chkDetalhefornecedor.Checked)OR( _chkDetalheComprador.Checked)  then
         add(',');
    end;

    if _chkDetalheComprador.Checked then
    begin
      add('cd_comprador');
      add(',nm_comprador');
      if (_chkMotraItens.Checked) OR (_chkDetalhefornecedor.Checked) then
         add(',');
    end;





//    if PnrComprador>0 then
 //   begin
  //    add(',cd_comprador ,nm_comprador');
  //  end;
    if _chkMotraItens.Checked then
    begin
    add('        EM.CD_MERCADORIA');
    add('       ,ME.CD_MERCADORIA*10+ME.NR_DV_MERCADORIA ');
    add('       ,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
//    add('       ,(EM.QT_FISICO - QT_RESERVADO- QT_RESERVA_PROBLEMATICA - QT_VENCIDO)');
     add('       ,(EM.QT_FISICO )');
    add('       ,CM.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR ');
    if _chkDetalhefornecedor.Checked then
        add(',');
    end;
    if _chkDetalhefornecedor.Checked then
    begin
       add('       CM.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR ');
      add(',cd_comprador ,nm_comprador');


    end;


    add(' ORDER BY 1');
     stQuery.SaveToFile('c:\temp\RelacaoPosi??o EstoqueCD.sql');
   end;





   with _cdsDetalheEstoque do
   begin
     close;
     CommandText:=stQuery.Text;

      if PcdOPeracaoRede>0 then
       Params.ParamByName('PnrCD').AsBCD:=PcdOPeracaoRede;
     if PnrComprador>0 then
       Params.ParamByName('PnrComprador').AsBCD:=PnrComprador;

     open;
   end;
  SetGridDetalhe(PnrComprador,PnrFornecedor,PcdOPeracaoRede,PnrCd);

 _btnExceEstoque.Enabled:=false;
  if not _cdsDetalheEstoque.IsEmpty then
     _btnExceEstoque.Enabled:=true;
 //  SetGridItemPedido;
 //  setDesabilitaEdicaoItem;
//   SetGridPedidoPendente;

//   if not _cdsLabPendencia.isEmpty then
  //    SetGridPendenciaLaboratorio

 finally
   FreeAndNil(stQuery);
 end;
end;


procedure T_frmRelatorioEstoquePorCD.SetGridDetalhe(PnrComprador,
                                                          PnrFornecedor,
                                                          PcdOPeracaoRede,
                                                          PnrCd:Integer);
begin

if _chkDetalheCD.Checked then
begin
 TStringField(_cdsDetalheEstoque.FieldByName('NM_EMPRESA')).DisplayLabel:='Local CD';
 TStringField(_cdsDetalheEstoque.FieldByName('NM_EMPRESA')).DisplayWidth:=20;
 TStringField(_cdsDetalheEstoque.FieldByName('id_unidade_federacao')).DisplayLabel:='UF';
 TStringField(_cdsDetalheEstoque.FieldByName('id_unidade_federacao')).DisplayWidth:=02;

 TIntegerField(_cdsDetalheEstoque.FieldByName('cd_empresa')).DisplayLabel:='Nr.CD';
 TIntegerField(_cdsDetalheEstoque.FieldByName('cd_empresa')).DisplayWidth:=03;
end;

 TIntegerField(_cdsDetalheEstoque.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
 TIntegerField(_cdsDetalheEstoque.FieldByName('NR_ITENS')).DisplayWidth:=03;


 if (_chkDetalheComprador.Checked) then
 begin
 TIntegerField(_cdsDetalheEstoque.FieldByName('nm_comprador')).DisplayLabel:='Comprador';
 TIntegerField(_cdsDetalheEstoque.FieldByName('nm_comprador')).DisplayWidth:=20;


  TStringField(_cdsDetalheEstoque.FieldByName('cd_comprador')).DisplayLabel:='Nr.Compr.';
  TStringField(_cdsDetalheEstoque.FieldByName('cd_comprador')).DisplayWidth:=06;
end;


 if _chkMotraItens.Checked then
 begin
  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=06;

  TStringField(_cdsDetalheEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
  TStringField(_cdsDetalheEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=06;

  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Prod.';
  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_PRODUTO')).DisplayWidth:=06;


  TStringField(_cdsDetalheEstoque.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
  TStringField(_cdsDetalheEstoque.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsDetalheEstoque.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsDetalheEstoque.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;
 end;

 if _chkDetalhefornecedor.Checked then
 begin
  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsDetalheEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=06;

  TStringField(_cdsDetalheEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
  TStringField(_cdsDetalheEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=06;



 end;


 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_ESTOQUE')).DisplayLabel:='Total Unid.';
 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_ESTOQUE')).DisplayWidth:=10;
 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_ESTOQUE')).DisplayFormat:='###,###,##0';




 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_CROSSDOCKING')).DisplayLabel:='Qtd.p/CROSSDOCKING.';
 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_CROSSDOCKING')).DisplayWidth:=10;
 TIntegerField(_cdsDetalheEstoque.FieldByName('QT_CROSSDOCKING')).DisplayFormat:='###,###,##0';

 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_CUSTO')).DisplayLabel:='Vlr.Total Estoque';
 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_CUSTO')).DisplayWidth:=12;
 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_CUSTO')).DisplayFormat:='###,##0.00';

 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_COMPRA')).DisplayLabel:='Vlr.Total Compra';
 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_COMPRA')).DisplayWidth:=12;
 TFloatField(_cdsDetalheEstoque.FieldByName('VT_ESTOQUE_COMPRA')).DisplayFormat:='###,##0.00';

TIntegerField(_cdsDetalheEstoque.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
TIntegerField(_cdsDetalheEstoque.FieldByName('QT_PENDENTE')).DisplayWidth:=06;
TIntegerField(_cdsDetalheEstoque.FieldByName('QT_PENDENTE')).DisplayFormat:='###,###,##0';

TIntegerField(_cdsDetalheEstoque.FieldByName('NR_ITENS_PENDENTE')).DisplayLabel:='Nr.Itens Pend.';
TIntegerField(_cdsDetalheEstoque.FieldByName('NR_ITENS_PENDENTE')).DisplayWidth:=06;
TIntegerField(_cdsDetalheEstoque.FieldByName('NR_ITENS_PENDENTE')).DisplayFormat:='###,###,##0';


TFloatField(_cdsDetalheEstoque.FieldByName('VT_PENDENCIA_FABRICA')).DisplayLabel:='Vlr.Total Pendencia';
TFloatField(_cdsDetalheEstoque.FieldByName('VT_PENDENCIA_FABRICA')).DisplayWidth:=12;
TFloatField(_cdsDetalheEstoque.FieldByName('VT_PENDENCIA_FABRICA')).DisplayFormat:='###,##0.00';

TIntegerField(_cdsDetalheEstoque.FieldByName('QT_TRANSITO')).DisplayLabel:='Qtd.Transito';
TIntegerField(_cdsDetalheEstoque.FieldByName('QT_TRANSITO')).DisplayWidth:=06;
TIntegerField(_cdsDetalheEstoque.FieldByName('QT_TRANSITO')).DisplayFormat:='###,###,##0';

TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_FABRICA')).DisplayLabel:='Vlr.Total Transito Fornec.';
TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_FABRICA')).DisplayWidth:=12;
TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_FABRICA')).DisplayFormat:='###,##0.00';

TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_CUSTO')).DisplayLabel:='Vlr.Total Transito Custo';
TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_CUSTO')).DisplayWidth:=12;
TFloatField(_cdsDetalheEstoque.FieldByName('VT_QT_TRANSITO_CUSTO')).DisplayFormat:='###,##0.00';


end;

procedure T_frmRelatorioEstoquePorCD._btnExceEstoqueClick(
  Sender: TObject);
 var
  nmArquivo:WideString;
begin
if not _cdsDetalheEstoque.IsEmpty then
begin
 nmArquivo:='c:\TEMP\RelatorioEstoqueCD_'+FormatDateTime('ddhhmmss',now)+'.csv';
 GerarTabelaArquivoCVS(_cdsDetalheEstoque,'Relatorio Estoque por Centro Distribui??o',  nmArquivo);
 ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
  Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
end;

end;

procedure T_frmRelatorioEstoquePorCD._dbgDetalheTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsDetalheEstoque,Column);
end;

procedure T_frmRelatorioEstoquePorCD.BitBtn1Click(Sender: TObject);
var
 nrCd,
 nrComprador :Integer;
begin

 nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

 nrComprador:= StrToIntDef(copy(_cobComprador.Text,1,2),0);


AbreTabelaEstoqueComprador(nrComprador,//PnrComprador,
                           0,//PnrFornecedor,
                           nrCd,//PcdOPeracaoRede,
                           0//PnrCd:Integer
                           );

end;

procedure T_frmRelatorioEstoquePorCD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=Cafree;
end;




procedure T_frmRelatorioEstoquePorCD.FormShow(Sender: TObject);
begin
  CarregaCompradores(0);
  CarregaCD;
end;

function T_frmRelatorioEstoquePorCD.CarregaCompradores(PnrComprador:Integer):Boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('DS_EMAIL_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('NR_COMPRADOR NOT IN(0,20,21,05) ORDER BY NM_COMPRADOR_REDUZIDO');
      open;
      first;
    end;
    Result:=true;
    _cobComprador.Clear;
    _cobComprador.Items.Add('00 - Comprador');

    while not QryTemp.Eof do
    begin
      _cobComprador.Items.Add(FormatFloat('00',QryTemp.FieldByName('NR_COMPRADOR').asinteger)+' - '+QryTemp.FieldByName('NM_COMPRADOR_REDUZIDO').AsString);
      QryTemp.Next;
    end;
    _cobComprador.ItemIndex:=0;
   finally
    FreeAndNil(QryTemp);
  end;
end;



procedure T_frmRelatorioEstoquePorCD.CarregaCD;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('order by CD_EMPRESA');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;

     _cbxOpcaoCDs.Items.Add(FormatFloat('00',0)+' - '+   'Todos' );
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add(  FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
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
