unit uProdutosReservaVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  uAuxiliarCompras, uRotinasGenericas,shellApi,sqlExpr, ExtCtrls;

type
  T_frmRelatorioProdutoReservaVencidos = class(TForm)
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
    GroupBox1: TGroupBox;
    _dbgProduto: TDBGrid;
    _dsProdutoFornecedor: TDataSource;
    _cdsProdutoFornecedor: TClientDataSet;
    _btnAbreTabela: TBitBtn;
    _rgReserva: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnAbreTabelaClick(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtNrCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgProdutoTitleClick(Column: TColumn);
  private
    procedure MostraDadosComprador;
    procedure setGridTabelaFornecedor;
    procedure CarregaEmpresa;
    procedure MostraDadosFornecedor;
    { Private declarations }
  public
    { Public declarations }
      DadosComprador :TDadosComprador;
     DadosFornecedor :TDescricaoFornecedor;
  end;

var
  _frmRelatorioProdutoReservaVencidos: T_frmRelatorioProdutoReservaVencidos;

implementation

uses uDm;

{$R *.dfm}

procedure T_frmRelatorioProdutoReservaVencidos._btnAbreTabelaClick(Sender: TObject);
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


  case _rgReserva.ItemIndex of
       0: idReservaPedido:=true;
       1: idReservaVencido:=true;
       2: idReservaAvaria:=true;
       3: idReservaBloqueado :=true;

  end;

  MostraDadosFornecedor;
  MostraDadosComprador;
  nrComprador  :=  StrToIntDef(_edtNrComprador.Text,0);
  nrCd         :=  StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

  nrFornecedor :=  StrToIntDef(_edtNrFornecedor.Text,0);

  _cdsProdutoFornecedor:=GeraTabelaProdutoReservaVencidos(nrFornecedor,nrComprador,nrCd,
                                                          idReservaPedido,
                                                          idReservaVencido,
                                                          idReservaAvaria,
                                                          idReservaBloqueado);

  if _cdsProdutoFornecedor<>nil then
  begin
    _dsProdutoFornecedor.DataSet:=_cdsProdutoFornecedor;
    _cdsProdutoFornecedor.Open;
    setGridTabelaFornecedor;
  end;

end;


procedure T_frmRelatorioProdutoReservaVencidos.setGridTabelaFornecedor;
begin



   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod. GAM';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayWidth:=06;



   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_EMPRESA')).DisplayLabel:='Nr.Empresa';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayWidth:=06;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_MERCADORIA')).DisplayLabel:='Qtd.Mercadoria';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_MERCADORIA')).DisplayWidth:=06;


   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=25;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_LOTE')).DisplayLabel:='Lote';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_LOTE')).DisplayWidth:=15;


   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_COMPRADOR')).DisplayWidth:=06;

   TStringField(_cdsProdutoFornecedor.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
   TStringField(_cdsProdutoFornecedor.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=10;


   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayLabel:='Dt.Validade';
   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayFormat:='dd/mm/yyyy';
   TDateField(_cdsProdutoFornecedor.FieldByName('DT_VALIDADE')).DisplayWidth:=10;



   TStringField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Cod.Fornecedor';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=10;

   TStringField(_cdsProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayLabel:='EAN Compra';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayWidth:=14;

   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

   TFloatField(_cdsProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayLabel:='% Desc.Padr?o';
   TFloatField(_cdsProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayWidth:=08;

 //  TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_FISICO')).DisplayLabel:='Estoque';
 //  TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_FISICO')).DisplayWidth:=06;

//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_RESERVADO')).DisplayLabel:='Qtd.Reserva Ped.';
//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_RESERVADO')).DisplayWidth:=06;

//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_RESERVA_PROBLEMATICA')).DisplayLabel:='Qtd. Avaria';
//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_RESERVA_PROBLEMATICA')).DisplayWidth:=06;

//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_VENCIDO')).DisplayLabel:='Qtd. Vencido';
//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_VENCIDO')).DisplayWidth:=06;

//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_BLOQUEADO')).DisplayLabel:='Qtd.Bloqueada';
//   TIntegerField(_cdsProdutoFornecedor.FieldByName('QT_BLOQUEADO')).DisplayWidth:=06;


   TStringField(_cdsProdutoFornecedor.FieldByName('CD')).DisplayLabel:='CD';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD')).DisplayWidth:=20;


end;

procedure T_frmRelatorioProdutoReservaVencidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;


procedure T_frmRelatorioProdutoReservaVencidos.FormShow(Sender: TObject);
begin
 CarregaEmpresa;
end;

PROCEDURE T_frmRelatorioProdutoReservaVencidos.MostraDadosComprador;
begin
    if Length(_edtNrComprador.Text)>0 then
    begin
        DadosComprador :=AbreDadosComprador(strtointdef(_edtNrComprador.Text,0));
        if DadosComprador.nrComprador=0 then
          _edtNomeComprador.Text:='Comprador n?o Localizado...';
        if DadosComprador.nrComprador>0 then
             _edtNomeComprador.Text:=DadosComprador.nmCompradorReduzido;
    end;

end;
PROCEDURE T_frmRelatorioProdutoReservaVencidos.MostraDadosFornecedor;
begin
               DadosFornecedor :=AbreDadosFornecedor(strtointdef(_edtNrFornecedor.Text,0));
               if DadosFornecedor.nr_Fornecedor=0 then
               begin
                 _edtNomeFornecedor.Text:='Fornecedor n?o Localizado...';
               end;
              if DadosFornecedor.nr_Fornecedor>0 then
              begin
                 _edtNomeFornecedor.Text:=DadosFornecedor.nm_Fornecedor;
                 _edtNrComprador.Text:= '';
                 _edtNomeComprador.Text:= '';
              end;

end;


procedure T_frmRelatorioProdutoReservaVencidos._btnParaExcelClick(
  Sender: TObject);
VAR
 nmArquivo:String;
begin
  nmArquivo:='c:\TEMP\RelatorioProdutoFornecedor_'+FormatDateTime('ddmmyyyyhhmmss',now)+'.csv';
  if _cdsProdutoFornecedor<>nil then
  begin
     //  GerarExcel(_cdsRetorno,'RetornoPedido_'+FormatDateTime('ddmmyyyy',dtSistema)+trim(_edtNrLista.Text)+'.XLS');
      GerarTabelaArquivoCVS(_cdsProdutoFornecedor,'Relatorio Produto Fornecedor',  nmArquivo);

    ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
    Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
  end;
end;


procedure T_frmRelatorioProdutoReservaVencidos._dbgProdutoTitleClick(
  Column: TColumn);
begin
   GeraOrdenacao(_cdsProdutoFornecedor,Column);
end;

procedure T_frmRelatorioProdutoReservaVencidos._edtNrCompradorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case Key of
   VK_RETURN :begin
               DadosComprador :=AbreDadosComprador(strtointdef(_edtNrComprador.Text,0));
               if DadosComprador.nrComprador=0 then
                 _edtNomeComprador.Text:='Comprador n?o Localizado...';
              if DadosComprador.nrComprador>0 then
                 _edtNomeComprador.Text:=DadosComprador.nmCompradorReduzido;

   end;
 end;

end;

procedure T_frmRelatorioProdutoReservaVencidos._edtNrFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case Key of
   VK_RETURN :MostraDadosFornecedor;


 end;

end;

procedure T_frmRelatorioProdutoReservaVencidos.CarregaEmpresa;
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
