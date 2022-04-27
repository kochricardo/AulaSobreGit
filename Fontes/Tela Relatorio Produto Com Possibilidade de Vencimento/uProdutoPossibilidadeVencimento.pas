unit uProdutoPossibilidadeVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  uAuxiliarCompras,uRotinasGenericas,sqlExpr,shellApi;

type
  T_frmProdutoPossibilidadeVencimento = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    _edtNrFornecedor: TEdit;
    _edtNomeFornecedor: TEdit;
    _cbxOpcaoCDs: TComboBox;
    _edtNrComprador: TEdit;
    _edtNomeComprador: TEdit;
    _btnParaExcel: TBitBtn;
    _btnAbreTabela: TBitBtn;
    GroupBox1: TGroupBox;
    _dbgProduto: TDBGrid;
    _dsProdutoFornecedor: TDataSource;
    _cdsProdutoFornecedor: TClientDataSet;
    procedure _btnAbreTabelaClick(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtNrCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgProdutoTitleClick(Column: TColumn);
    procedure _btnParaExcelClick(Sender: TObject);
  private
    procedure setGridTabelaFornecedor;
    procedure MostraDadosComprador;
    procedure MostraDadosFornecedor;
    procedure CarregaEmpresa;
    { Private declarations }
  public
    { Public declarations }
    DadosComprador :TDadosComprador;
     DadosFornecedor :TDescricaoFornecedor;

  end;

var
  _frmProdutoPossibilidadeVencimento: T_frmProdutoPossibilidadeVencimento;

implementation

uses uDm;





{$R *.dfm}

procedure T_frmProdutoPossibilidadeVencimento._btnAbreTabelaClick(Sender: TObject);
var
  nrComprador,
  nrCd,
  nrFornecedor :integer;
  idReservaPedido,
  idReservaVencido,
  idReservaAvaria,
  idReservaBloqueado :Boolean;

begin

  idReservaPedido:=false;
  idReservaVencido:=false;
  idReservaAvaria:=false;
  idReservaBloqueado :=false;



  MostraDadosFornecedor;
  MostraDadosComprador;
  nrComprador  :=  StrToIntDef(_edtNrComprador.Text,0);
  nrCd         :=  StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

  nrFornecedor :=  StrToIntDef(_edtNrFornecedor.Text,0);

  _cdsProdutoFornecedor:=GeraTabelaProdutoPossibilidadedeVencimemto(nrFornecedor,nrComprador,nrCd);

  if _cdsProdutoFornecedor<>nil then
  begin
    _dsProdutoFornecedor.DataSet:=_cdsProdutoFornecedor;
    _cdsProdutoFornecedor.Open;
    setGridTabelaFornecedor;
  end;

end;




procedure T_frmProdutoPossibilidadeVencimento._btnParaExcelClick(
  Sender: TObject);
VAR
 nmArquivo:String;
begin
  nmArquivo:='c:\TEMP\RelPodutoPossibilidadedeVencerEmEstoque_'+FormatDateTime('ddmmyyyyhhmmss',now)+'.csv';
  if _cdsProdutoFornecedor<>nil then
  begin
     //  GerarExcel(_cdsRetorno,'RetornoPedido_'+FormatDateTime('ddmmyyyy',dtSistema)+trim(_edtNrLista.Text)+'.XLS');
      GerarTabelaArquivoCVS(_cdsProdutoFornecedor,'Rel. com Poduto Possibilidade de Vencer Em Estoque',  nmArquivo);

    ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
    Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
  end;

end;

procedure T_frmProdutoPossibilidadeVencimento._dbgProdutoTitleClick(
  Column: TColumn);
begin
 GeraOrdenacao(_cdsProdutoFornecedor,Column);
end;

procedure T_frmProdutoPossibilidadeVencimento._edtNrCompradorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case Key of
   VK_RETURN :MostraDadosComprador;


 end;

end;

procedure T_frmProdutoPossibilidadeVencimento._edtNrFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case Key of
   VK_RETURN :MostraDadosFornecedor;


 end;

end;

procedure T_frmProdutoPossibilidadeVencimento.setGridTabelaFornecedor;
begin

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

   TStringField(_cdsProdutoFornecedor.FieldByName('CD')).DisplayLabel:='CD';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD')).DisplayWidth:=25;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=5;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Produto';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayWidth:=8;

   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresetação do Produto';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_LOTE')).DisplayLabel:='Lote';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_LOTE')).DisplayWidth:=20;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_MERCADORIA')).DisplayLabel:='Qt.Estoque';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_MERCADORIA')).DisplayWidth:=8;

   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayLabel:='Dt. Validade';
   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayFormat:='dd/mm/yyyy';
   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayWidth:=10;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_EMPRESA')).DisplayLabel:='CD';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_EMPRESA')).DisplayWidth:=02;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('DIAS_A_VENCER')).DisplayLabel:='Dias Ate Vencimento';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('DIAS_A_VENCER')).DisplayWidth:=08;

   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_MEDIA_VENDA_DIARIA')).DisplayLabel:='Media Venda Diaria';
   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_MEDIA_VENDA_DIARIA')).DisplayFormat:='###,###,##0';
   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_MEDIA_VENDA_DIARIA')).DisplayWidth:=12;

   TFloatField(_cdsProdutoFornecedor.FieldByName('VENDA_ESTIMADA')).DisplayLabel:='Venda Estimada';
   TFloatField(_cdsProdutoFornecedor.FieldByName('VENDA_ESTIMADA')).DisplayFormat:='###,###,##0';
   TFloatField(_cdsProdutoFornecedor.FieldByName('VENDA_ESTIMADA')).DisplayWidth:=12;

   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_CROSSDOCKING')).DisplayLabel:='Qtd. Crossdocking';
   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_CROSSDOCKING')).DisplayFormat:='###,###,##0';
   TFloatField(_cdsProdutoFornecedor.FieldByName('QT_CROSSDOCKING')).DisplayWidth:=12;


   TStringField(_cdsProdutoFornecedor.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Comprador';
   TStringField(_cdsProdutoFornecedor.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=20;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('NR_COMPRADOR')).DisplayLabel:='Nr.Comprador';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('NR_COMPRADOR')).DisplayWidth:=05;



end;


procedure T_frmProdutoPossibilidadeVencimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmProdutoPossibilidadeVencimento.FormShow(Sender: TObject);
begin
CarregaEmpresa;
end;

PROCEDURE T_frmProdutoPossibilidadeVencimento.MostraDadosComprador;
begin
    if Length(_edtNrComprador.Text)>0 then
    begin
        DadosComprador :=AbreDadosComprador(strtointdef(_edtNrComprador.Text,0));
        if DadosComprador.nrComprador=0 then
          _edtNomeComprador.Text:='Comprador não Localizado...';
        if DadosComprador.nrComprador>0 then
             _edtNomeComprador.Text:=DadosComprador.nmCompradorReduzido;
    end;

end;
PROCEDURE T_frmProdutoPossibilidadeVencimento.MostraDadosFornecedor;
begin
               DadosFornecedor :=AbreDadosFornecedor(strtointdef(_edtNrFornecedor.Text,0));
               if DadosFornecedor.nr_Fornecedor=0 then
               begin
                 _edtNomeFornecedor.Text:='Fornecedor não Localizado...';
               end;
              if DadosFornecedor.nr_Fornecedor>0 then
              begin
                 _edtNomeFornecedor.Text:=DadosFornecedor.nm_Fornecedor;
                 _edtNrComprador.Text:= '';
                 _edtNomeComprador.Text:= '';
              end;

end;


procedure T_frmProdutoPossibilidadeVencimento.CarregaEmpresa;
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
