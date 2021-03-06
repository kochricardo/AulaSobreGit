unit uRelatorioProdutoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ComCtrls,uDm,sqlExpr,
  uAuxiliarCompras, uRotinasGenericas, DB, DBClient,ShellApi;

type
  T_frmRelatorioProdutoFornecedor = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    _edtNrFornecedor: TEdit;
    _edtNomeFornecedor: TEdit;
    GroupBox1: TGroupBox;
    _dbgProduto: TDBGrid;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _dsProdutoFornecedor: TDataSource;
    _cdsProdutoFornecedor: TClientDataSet;
    Label4: TLabel;
    Label6: TLabel;
    _edtNrComprador: TEdit;
    _edtNomeComprador: TEdit;
    _btnPesquisar: TBitBtn;
    _btnParaExcel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtNrCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgProdutoTitleClick(Column: TColumn);
    procedure _btnPesquisarClick(Sender: TObject);
    procedure _btnLayoutPedidoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure CarregaEmpresa;
    procedure setGridTabelaFornecedor;
    procedure MostraDadosComprador;
    procedure GerarPanilhaPedidoCVS(PTabela: TDataSet; PstTituloRelatorio,
      PnmArquivo: String);
    { Private declarations }
  public
    { Public declarations }
    DadosComprador :TDadosComprador;
    DadosFornecedor :TDescricaoFornecedor;

  end;

var
  _frmRelatorioProdutoFornecedor: T_frmRelatorioProdutoFornecedor;

implementation





{$R *.dfm}


procedure T_frmRelatorioProdutoFornecedor.setGridTabelaFornecedor;
begin

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod. GAM';
   TIntegerField(_cdsProdutoFornecedor.FieldByName('CD_PRODUTO')).DisplayWidth:=06;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=30;

   TStringField(_cdsProdutoFornecedor.FieldByName('CD_INDUSTRIA')).DisplayLabel:='Cod.Fornecedor';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD_INDUSTRIA')).DisplayWidth:=10;

   TStringField(_cdsProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayLabel:='EAN Compra';
   TStringField(_cdsProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayWidth:=14;

   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
   TStringField(_cdsProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
   TStringField(_cdsProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

   TFloatField(_cdsProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayLabel:='% Desc.Padr?o';
   TFloatField(_cdsProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO_COMPRA')).DisplayWidth:=08;

end;

procedure T_frmRelatorioProdutoFornecedor._btnPesquisarClick(Sender: TObject);
var
  nrComprador,
  nrCd,
  nrFornecedor :integer;
begin
  MostraDadosComprador;
  nrComprador  :=  StrToIntDef(_edtNrComprador.Text,0);
  nrCd         :=  StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

  nrFornecedor :=  StrToIntDef(_edtNrFornecedor.Text,0);

  _cdsProdutoFornecedor:=GeraTabelaProdutoFornecedor(nrFornecedor,nrComprador,nrCd);

  if _cdsProdutoFornecedor<>nil then
  begin
    _dsProdutoFornecedor.DataSet:=_cdsProdutoFornecedor;
    _cdsProdutoFornecedor.Open;
    setGridTabelaFornecedor;
  end;


end;

procedure T_frmRelatorioProdutoFornecedor._btnLayoutPedidoClick(Sender: TObject);
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

procedure T_frmRelatorioProdutoFornecedor.BitBtn1Click(Sender: TObject);
 VAR
 nmArquivo:String;
begin
  if _cdsProdutoFornecedor<>nil then
  begin
  nmArquivo:='c:\TEMP\PlanilhaLayOPedido_'+  StringReplace(_cdsProdutoFornecedor.FieldByName('DS_grupo_FORNECEDOR').AsString,'/','_',[])+FormatDateTime('ddmmyyyy',now)+'.csv';
  GerarPanilhaPedidoCVS(_cdsProdutoFornecedor,'',nmArquivo);
   ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
   Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
  end;
end;

procedure T_frmRelatorioProdutoFornecedor.CarregaEmpresa;
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


procedure T_frmRelatorioProdutoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmRelatorioProdutoFornecedor.FormCreate(Sender: TObject);
begin
 CarregaEmpresa;


end;

procedure T_frmRelatorioProdutoFornecedor._dbgProdutoTitleClick(
  Column: TColumn);
begin
  GeraOrdenacao(_cdsProdutoFornecedor,Column);
end;

procedure T_frmRelatorioProdutoFornecedor._edtNrCompradorKeyDown(
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

procedure T_frmRelatorioProdutoFornecedor._edtNrFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case Key of
   VK_RETURN :begin
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
                 _btnPesquisar.Click;
              end;

   end;
 end;

end;


PROCEDURE T_frmRelatorioProdutoFornecedor.MostraDadosComprador;
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




Procedure  T_frmRelatorioProdutoFornecedor.GerarPanilhaPedidoCVS(PTabela:TDataSet;PstTituloRelatorio,PnmArquivo:String);
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


   J:=0;
   stLinha:=EmptyStr;


    stLinha:= 'Cod. GAM;Cod.Fornec.;Cod.EAN;Qtdade;Nome e Apresenta??o;P?o. Unit.;% Desc.Adicional;% Desc.Total;Nr.Verba;Nr.Operador Logistico';

   inc(j);
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
   end;  }



   stLinha:= PTabela.FieldByName('CD_PRODUTO').AsString+';'+
             PTabela.FieldByName('CD_INDUSTRIA').AsString+';'+
             PTabela.FieldByName('CD_EAN_COMPRA').AsString+';'+
             '    '+';'+
             PTabela.FieldByName('NM_MERCADORIA').AsString+'  '+
             PTabela.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString +';'+
             '    '+';'+
             '    '+';'+
             '    '+';'+
             '    '+';'+
             '1';

   Writeln(arq,stLinha);

      PTabela.Next;
    end;
    CloseFile(arq);
   PTabela.EnableControls;

  //  ShellExecute(Handle, 'Open',PnmArquivo , nil, 'C:\TEMP\', SW_SHOWNORMAL);
  finally
    stLista.Free;
  end;


end;
end;

end.
