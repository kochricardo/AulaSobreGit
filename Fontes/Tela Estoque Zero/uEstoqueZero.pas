unit uEstoqueZero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ComCtrls, Grids, DBGrids, DBClient, Buttons, uDm,
  uRotinasGenericas,ShellApi,sqlExpr;

type
  T_frmEstoqueZero = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _edtNrComprador: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    _dsEstoqueZero: TDataSource;
    _cdsEstoqueZero: TClientDataSet;
    DBGrid1: TDBGrid;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    _cbxOperacaoRede: TComboBox;
    Label3: TLabel;
    procedure _btnExecutaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    procedure MostraProdutoZero(nrComprador, nrCd,PnrOPeracaoRede: Integer);
    procedure SetGridItens;
    procedure CarregaEmpresa;
    procedure CarregaOperacaoRede;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEstoqueZero: T_frmEstoqueZero;

implementation

{$R *.dfm}

procedure T_frmEstoqueZero.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    If odd(_dsEstoqueZero.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
   end
   else
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
   end;


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;
 DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;
end;

procedure T_frmEstoqueZero.DBGrid1TitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsEstoqueZero,Column);
end;

procedure T_frmEstoqueZero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmEstoqueZero.FormShow(Sender: TObject);
begin
 _edtNrComprador.Text:=IntToStr(nrCompradorSistema);
 CarregaEmpresa;
 CarregaOperacaoRede;

end;

procedure T_frmEstoqueZero.MostraProdutoZero(nrComprador,nrCd,PnrOPeracaoRede:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin

    add('SELECT  CD,');
    add('CODIGO,NM_MERCADORIA,');
    add('DS_APRESENTACAO_MERCADORIA, VL_UNITARIO_COMPRA,');
    add('QT_VENDA_MES,');
    add('QT_VENDA_MEDIA_DIARIA,');
    add('QT_PENDENTE,');
    add('CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('QT_FISICO,QT_RESERVA_PROBLEMATICA,QT_VENCIDO,DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA,');
    add('PRODUTO.CD_EMPRESA,PRODUTO.CD_MERCADORIA');
    add('FROM');
    add('(SELECT ID_UNIDADE_FEDERACAO||''-''|| NM_EMPRESA  AS CD,');
    add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CODIGO,NM_MERCADORIA,');
    add('DS_APRESENTACAO_MERCADORIA, NVL(VL_PRECO_COMPRA,0) AS VL_UNITARIO_COMPRA,');
    add('MERCADORIA.CD_MERCADORIA,');
    add('COMPRA_MERCADORIA.CD_EMPRESA,');
    add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
    ADD('DS_GRUPO_FORNECEDOR,');
    ADD('QT_FISICO,QT_RESERVA_PROBLEMATICA,QT_VENCIDO,DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA');
    add('FROM');
    add('PRDDM.DC_MERCADORIA MERCADORIA,');
    add('PRDDM.DC_FISCAL_MERCADORIA FISCAL_MERCADORIA,');
    add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA ,');
    add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO_MERCADORIA,');
    add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA');
    add('JOIN ACESSO.DC_EMPRESA EMP ON');
    add('EMP.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA AND ID_EMPRESA_FISICA=''S'' AND ID_SITUACAO_EMPRESA=''A''');
    add('WHERE');
    add('ESTOQUE_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND FINANCEIRO_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND FINANCEIRO_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
    add('AND FISCAL_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
    add('AND FISCAL_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND COMPRA_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
    add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
    add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND QT_FISICO -  QT_RESERVADO -  QT_RESERVA_PROBLEMATICA- QT_VENCIDO<=0');
    if nrComprador>0 then
       add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
    if nrCd>0 then
       add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrEmpresa');
    if PnrOPeracaoRede=0 then
       add('AND ESTOQUE_MERCADORIA.CD_EMPRESA IN(SELECT cd_empresa FROM acesso.dc_empresa WHERE id_situacao_empresa=''A'' AND id_operacao_rede=''N'')');

    if PnrOPeracaoRede>0 then
       add('AND ESTOQUE_MERCADORIA.CD_EMPRESA IN(SELECT cd_empresa FROM acesso.dc_empresa WHERE id_operacao_rede=''S''  and  cd_empresa=:PnrOPeracaoRede)');

    ADD(') PRODUTO');


    add('LEFT OUTER JOIN (SELECT CD_MERCADORIA,SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)) AS QT_VENDA_MEDIA_DIARIA,');
    add('       SUM(NVL(QT_VENDIDA,0)) AS QT_VENDA_MES ,CD_EMPRESA');
    add('   FROM');
    add('    PRDDM.DW_VENDA_ACUMULADA_MERCADORIA');
    add('    WHERE');
//     DT_VENDA_MERCADORIA= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
     add('  DT_VENDA_MERCADORIA>= (SELECT Max(dt_venda_mercadoria) AS dt_venda_mercadoria FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA)');



    add('    GROUP BY CD_MERCADORIA,CD_EMPRESA )  VENDA  ON  VENDA.CD_MERCADORIA=PRODUTO.CD_MERCADORIA');
    add('                                                            AND VENDA.CD_EMPRESA=PRODUTO.CD_EMPRESA');
    add('LEFT OUTER JOIN (SELECT  NVL(SUM(QUAY_Y-CHEY_Y),0) AS  QT_PENDENTE,NROM_Y,cd_empresa_destino as CD_EMPRESA');
    add('FROM PRDDM.DCPCC C,');
    add('PRDDM.DCPCI I');
    add('WHERE NROP_P=NROP_Y AND SITY_Y IN(''N'',''P'',''T'')');
    add('GROUP BY  NROM_Y,cd_empresa_destino) PENDENCIA ON PENDENCIA.NROM_Y=PRODUTO.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=PRODUTO.CD_EMPRESA');


//    add('ORDER BY ds_grupo_fornecedor,nm_mercadoria,ds_apresentacao_mercadoria,id_unidade_federacao||''-''|| nm_empresa');
   end;
   stQuery.SaveToFile('c:\TEMP\ItensComEstoqueZerado.sql');
   with _cdsEstoqueZero do
   begin
     close;
     CommandText:=stQuery.Text;
     if nrCd>0 then
       Params.ParamByName('PnrEmpresa').AsBcd:=nrCd;
     if nrComprador>0 then
       Params.ParamByName('PnrComprador').AsBcd:=nrComprador;

     if PnrOPeracaoRede>0 then
       Params.ParamByName('PnrOPeracaoRede').AsBcd:=PnrOPeracaoRede;

    open;
    SetGridItens;
   end;
    StatusBar1.Panels[1].Text:='Nr. Itens a Zero --> '+FormatFloat('###,###,##0',0);
    if not _cdsEstoqueZero.IsEmpty then
    begin
      _cdsEstoqueZero.IndexFieldNames:='CD_GRUPO_FORNECEDOR;NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
      _cdsEstoqueZero.First;
      StatusBar1.Panels[1].Text:='Nr. Itens a Zero --> '+FormatFloat('###,###,##0',_cdsEstoqueZero.RecordCount);
    end;


 finally
   freeAndNil(stQuery);
 end;
end;
procedure T_frmEstoqueZero._btnExecutaClick(Sender: TObject);
var
 nrComprador,nrCD,
 nrRede:Integer;
begin
  nrComprador:=StrToIntDef(_edtNrComprador.Text,0);
  nrCD :=StrToIntDef(copy(_cbxOpcaoCDs.Text,0,2),0);
  nrRede:=StrToIntDef(copy(_cbxOperacaoRede.Text,0,2),0);
  MostraProdutoZero(nrComprador,nrcd,nrRede);
end;


procedure T_frmEstoqueZero._btnParaExcelClick(Sender: TObject);
var
 nmArquivo: String;
begin
if not _cdsEstoqueZero.IsEmpty then
begin
_btnParaExcel.Enabled:=false;
 nmArquivo:='c:\TEMP\RelatorioItensZerado_'+FormatDateTime('yyyymmddhhmmss',now)+'.csv';

StatusBar1.Panels[1].Text:='Aguarde montando planilha...';

//        GerarExcel(_cdsEstoqueZero);
        GerarTabelaArquivoCVS(_cdsEstoqueZero,'Reltorio de Itens com Estoque a Zero',nmArquivo);

_btnParaExcel.Enabled:=true;
StatusBar1.Panels[1].Text:='Planilha Gerada!!! ';
 ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
end;


end;

procedure T_frmEstoqueZero.SetGridItens;
begin




  TIntegerField(_cdsEstoqueZero.FieldByName('CODIGO')).DisplayLabel:='Codigo';
  TIntegerField(_cdsEstoqueZero.FieldByName('CODIGO')).DisplayWidth:=8;

  TStringField(_cdsEstoqueZero.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsEstoqueZero.FieldByName('NM_MERCADORIA')).DisplayWidth:=25;

  TStringField(_cdsEstoqueZero.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsEstoqueZero.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=25;

  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayLabel:='Pre?o Compra';
  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayWidth:=13;
  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayFormat:='###,###,##0.00';

  TIntegerField(_cdsEstoqueZero.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr. Fornecedor';
  TIntegerField(_cdsEstoqueZero.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=8;

  TStringField(_cdsEstoqueZero.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Forncedor';
  TStringField(_cdsEstoqueZero.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=30;

  TStringField(_cdsEstoqueZero.FieldByName('CD')).DisplayLabel:='CD';
  TStringField(_cdsEstoqueZero.FieldByName('CD')).DisplayWidth:=25;

  TIntegerField(_cdsEstoqueZero.FieldByName('QT_FISICO')).DisplayLabel:='Qtd.Estoque';
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_FISICO')).DisplayWidth:=8;

  TIntegerField(_cdsEstoqueZero.FieldByName('QT_RESERVA_PROBLEMATICA')).DisplayLabel:='Qtd.C/Problemas';
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_RESERVA_PROBLEMATICA')).DisplayWidth:=8;

  TIntegerField(_cdsEstoqueZero.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_PENDENTE')).DisplayWidth:=8;

  TIntegerField(_cdsEstoqueZero.FieldByName('QT_VENCIDO')).DisplayLabel:='Qtd.Vencido';
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_VENCIDO')).DisplayWidth:=8;


  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayLabel:='Pre?o Compra';
  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayWidth:=13;
  TFloatField(_cdsEstoqueZero.FieldByName('VL_UNITARIO_COMPRA')).DisplayFormat:='###,###,##0.00';


  TFloatField(_cdsEstoqueZero.FieldByName('QT_VENDA_MEDIA_DIARIA')).DisplayLabel:='Media Dia';
  TFloatField(_cdsEstoqueZero.FieldByName('QT_VENDA_MEDIA_DIARIA')).DisplayWidth:=10;
  TFloatField(_cdsEstoqueZero.FieldByName('QT_VENDA_MEDIA_DIARIA')).DisplayFormat:='##,##0.00';


  TIntegerField(_cdsEstoqueZero.FieldByName('QT_VENDA_MES')).DisplayLabel:='Qtd.Venda Mes';
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_VENDA_MES')).DisplayWidth:=8;
  TIntegerField(_cdsEstoqueZero.FieldByName('QT_VENDA_MES')).DisplayFormat:='###,###,##0';

  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_ENTRADA')).DisplayLabel:='Ult.Entrada';
  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_ENTRADA')).DisplayWidth:=10;
  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_ENTRADA')).DisplayFormat:='dd/mm/yyyy';


  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_SAIDA')).DisplayLabel:='Ult.Saida';
  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_SAIDA')).DisplayWidth:=10;
  TDateField(_cdsEstoqueZero.FieldByName('DT_ULTIMA_SAIDA')).DisplayFormat:='dd/mm/yyyy';


  TIntegerField(_cdsEstoqueZero.FieldByName('cd_empresa')).Visible:=False;
  TIntegerField(_cdsEstoqueZero.FieldByName('cd_mercadoria')).Visible:=False;



end;


procedure T_frmEstoqueZero.CarregaEmpresa;
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


procedure T_frmEstoqueZero.CarregaOperacaoRede;
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
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''N''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''S''');
    tempQuery.Open;
    tempQuery.First;

    _cbxOperacaoRede.Clear;

     _cbxOperacaoRede.Items.Add(FormatFloat('00',0)+' - '+
                                  FormatFloat('00',0)+' - '+
                                  'Estoque GAM' );
    while not tempQuery.eof do
    begin
       _cbxOperacaoRede.Items.Add(FormatFloat('00',tempQuery.FieldByName('cd_empresa').AsInteger)+' - '+
                                  FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOperacaoRede.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;


end.
