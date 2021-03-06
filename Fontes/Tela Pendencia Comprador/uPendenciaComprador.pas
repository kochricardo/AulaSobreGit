unit uPendenciaComprador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, uRotinasGenericas,
  uAuxiliarCompras, uSistemaCompras, ComCtrls,Sqlexpr,ShellAPI;

//type

 //  TMinhaJanelaHint = class(THintWindow)
//   public
       //procedure doActivateHint(Sender: TObject);
//end;


type
  TCellGrid = class(Grids.TCustomGrid);
  T_frmPendenciaComprador = class(TForm)
    GroupBox1: TGroupBox;
    _cdsItensPendentes: TClientDataSet;
    _dsItensPendentes: TDataSource;
    _dbgItemPendentes: TDBGrid;
    GroupBox2: TGroupBox;
    _edtNrComprador: TEdit;
    Label1: TLabel;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    _bitFechar: TBitBtn;
    _edtNrFornecedor: TEdit;
    Label2: TLabel;
    _chkItensNaoFaturados: TCheckBox;
    StatusBar1: TStatusBar;
    _edtNrPedido: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    _cbxOperacaoRede: TComboBox;
    _edtNrProduto: TEdit;
    Label5: TLabel;
    procedure _bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _btnExecutaClick(Sender: TObject);
    procedure _dbgItemPendentesTitleClick(Column: TColumn);
    procedure _dbgItemPendentesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgItemPendentesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgItemPendentesDblClick(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _dbgItemPendentesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    procedure setGridItemPendente;
    procedure EliminaPendenciaItem;
    procedure AbreItensPendendes;
    procedure mouseToCell(X, Y: integer; var ACol, ARow: Integer);
    procedure EliminaTodasPendenciaListada;
    procedure CarregaOperacaoRede;
    procedure filtraPendencia;
    { Private declarations }
  public
    { Public declarations }
    nrCompradorPendencia:Integer;
    nrFornecedorPendencia:Integer;
   //  MeuHint: TMinhaJanelaHint;

  end;

var
  _frmPendenciaComprador: T_frmPendenciaComprador;

implementation

uses uDm;

{$R *.dfm}

procedure T_frmPendenciaComprador._dbgItemPendentesDblClick(Sender: TObject);
begin
  EliminaPendenciaItem;
end;

procedure T_frmPendenciaComprador._dbgItemPendentesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   with _dbgItemPendentes do
   begin

// mude a cor das Linha
 if _cdsItensPendentes<>nil then
 begin
   If odd(_cdsItensPendentes.RecNo) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
//

// mude a cor da Linha para Itens Bonificadi
 if (Column.Field.FieldName = 'BONIFICADO') then
 begin

      if _cdsItensPendentes.FieldByName('ID_BONIFICADO').AsString='S' then
      begin
              Canvas.brush.Color:= clBlue;
              Canvas.Font.Color:= clwhite;
      end;
 end;

// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clYellow;
         Canvas.Font.Color:= clBlack;
      end;

     if (Column.Field.FieldName = 'QT_PENDENTE') then
     begin
      if (_cdsItensPendentes.FieldByName('QT_PENDENTE').AsInteger>0) AND
         (_cdsItensPendentes.FieldByName('DT_PREVISAO').AsDateTime<dtSistema) then
      begin
        Canvas.brush.Color:= clYellow;
        Canvas.Font.Color:= clBLACK;
      end;
     end;



     if (Column.Field.FieldName = 'ID_CD') then
     begin
      if _cdsItensPendentes.FieldByName('ID_CD').AsString='SC' then
      begin
        Canvas.brush.Color:= clGreen;
        Canvas.Font.Color:= clwhite;
      end;
      if _cdsItensPendentes.FieldByName('ID_CD').AsString='RS' then
      begin
        Canvas.brush.Color := $000080FF;
        Canvas.Font.Color := clBlack;
      end;
    end;
    // mude a cor da Linha para pedidos em transito
      if _cdsItensPendentes.FieldByName('ID_NFE_TRANSITO').AsString='S' then
      begin
              Canvas.brush.Color:= clGreen;
              Canvas.Font.Color:= clwhite;
      end;

      if (_cdsItensPendentes.FieldByName('QT_ITEM_PEDIDO_CRITICA').AsInteger>0) and (_cdsItensPendentes.FieldByName('nr_nfe').AsInteger=0) then
      begin
              Canvas.brush.Color:= clRed;
              Canvas.Font.Color:= clwhite;

      end;



    DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
  end;
end;

procedure T_frmPendenciaComprador._dbgItemPendentesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
     vk_f5  : EliminaPendenciaItem;
     vk_f10  : EliminaTodasPendenciaListada;
   VK_DELETE : EliminaPendenciaItem;
   end;
end;

procedure T_frmPendenciaComprador._dbgItemPendentesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   MColumn, MRow: Longint;
begin
{  if _dbgItemPendentes.DataSource.DataSet.State<>dsEdit then
  begin
   // A partir da posi??o do mouse obtemos a coordenada da c?lula do grid
   MouseToCell(X,Y,MColumn,MRow);
   // Se for uma c?lula v?lida ...
   if (MRow > 0) and (MColumn >0) and (Mcolumn <= _dbgItemPendentes.Columns.Count) then
   begin
      // Fazemos a coluna do Grid ser a coluna apontada pelo mouse, para isso usamos a classe amiga
      // definida no come?o da unit
      TCellGrid(_dbgItemPendentes).Col := MColumn;

      // Movemos o DataSet para a linha apontada pelo mouse deslocando em rela??o ? sua posi??o
      // anterior
      _dbgItemPendentes.DataSource.DataSet.MoveBy(MRow - TCellGrid(_dbgItemPendentes).Row);

      // Se o dado apontado n?o for do tipo String nem Variant n?o apresentamos o Hint




  if _cdsItensPendentes.FieldByName('ID_BONIFICADO').AsString='S' then
  begin
    _dbgItemPendentes.Hint:='Item Bonificado!!!';
     //MeuHint.doActivateHint(_dbgItemPendentes);
    // MeuHint.ReleaseHandle;
  end;
  if (_cdsItensPendentes.FieldByName('ID_BONIFICADO').AsString<>'S') and
     (_cdsItensPendentes.FieldByName('ID_NFE_TRANSITO').AsString<>'S') then
  begin
  _dbgItemPendentes.Hint:='';
   //MeuHint.doActivateHint(_dbgItemPendentes);
  end;
 end;
  end;
 end;}

end;

procedure T_frmPendenciaComprador._dbgItemPendentesTitleClick(Column: TColumn);
var
  i, iTemp : Integer;
  sColuna_Pesquisa:String;
begin
  i := 0;
  iTemp := _dbgItemPendentes.Columns.Count;
  While i < iTemp Do Begin
    _dbgItemPendentes.Columns.Items[i].Title.Font.Style := [];
    i := i + 1;
  End;
  Column.Title.Font.Style := [fsBold];
  sColuna_Pesquisa := Column.Field.Origin;
  GeraOrdenacao(_cdsItensPendentes,Column);
end;

procedure T_frmPendenciaComprador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmPendenciaComprador.FormShow(Sender: TObject);
begin
   //MeuHint := TMinhaJanelaHint.Create(Self);
   _btnExecuta.ShowHint:=true;
  _btnExecuta.Hint:='Gera relatorio Pendencia '+#13+
                    ' para gerar relatorio de todos compradores zere(0)'+#13+
                    ' Nr. Comprador.';


  _edtNrComprador.Text:=FormatFloat('000',nrCompradorSistema);
  CarregaOperacaoRede;
end;

procedure T_frmPendenciaComprador._bitFecharClick(Sender: TObject);
begin
 close;
end;

procedure T_frmPendenciaComprador._btnExecutaClick(Sender: TObject);
begin
 AbreItensPendendes;
if _cdsItensPendentes<>nil then
     filtraPendencia;
end;

procedure T_frmPendenciaComprador._btnParaExcelClick(Sender: TObject);
  VAR
 nmArquivo:String;
begin
  nmArquivo:='c:\TEMP\RelatorioPendencia_'+FormatDateTime('ddmmyyyyhhmmss',dtSistema)+'.csv';
  if _cdsItensPendentes<>nil then
  begin
   if not  _cdsItensPendentes.IsEmpty then
   begin

     //  GerarExcel(_cdsRetorno,'RetornoPedido_'+FormatDateTime('ddmmyyyy',dtSistema)+trim(_edtNrLista.Text)+'.XLS');
      GerarTabelaArquivoCVS(_cdsItensPendentes,'Relatorio Pendencia de Pedido',  nmArquivo);

    ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
    Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
   end
   else
      Mensagem('Tabela Vazia!!!',MB_ICONQUESTION);

  end;




//  GerarExcel(_cdsItensPendentes);


end;

procedure T_frmPendenciaComprador.setGridItemPendente;
begin

  TStringField(_cdsItensPendentes.FieldByName('NM_EMPRESA')).DisplayLabel:='CD.';
  TStringField(_cdsItensPendentes.FieldByName('NM_EMPRESA')).DisplayWidth:=20;


  TStringField(_cdsItensPendentes.FieldByName('id_Crossdocking')).DisplayLabel:='O.C.D.';
  TStringField(_cdsItensPendentes.FieldByName('id_Crossdocking')).DisplayWidth:=20;

  TIntegerField(_cdsItensPendentes.FieldByName('NR_FORNCEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsItensPendentes.FieldByName('NR_FORNCEDOR')).DisplayWidth:=005;

  TStringField(_cdsItensPendentes.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdsItensPendentes.FieldByName('NM_FORNECEDOR')).DisplayWidth:=20;

  TStringField(_cdsItensPendentes.FieldByName('BONIFICADO')).DisplayLabel:='Item Bonif.';
  TStringField(_cdsItensPendentes.FieldByName('BONIFICADO')).DisplayWidth:=20;

  TStringField(_cdsItensPendentes.FieldByName('CD_EAN_VENDA')).DisplayLabel:='EAN';
  TStringField(_cdsItensPendentes.FieldByName('CD_EAN_VENDA')).DisplayWidth:=14;

  TIntegerField(_cdsItensPendentes.FieldByName('NR_PEDIDO')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsItensPendentes.FieldByName('NR_PEDIDO')).DisplayWidth:=008;

  TDateField(_cdsItensPendentes.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsItensPendentes.FieldByName('DT_PEDIDO')).DisplayWidth:=010;
  TDateField(_cdsItensPendentes.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';

  TDateField(_cdsItensPendentes.FieldByName('DT_PREVISAO')).DisplayLabel:='Dt.Previs?o';
  TDateField(_cdsItensPendentes.FieldByName('DT_PREVISAO')).DisplayWidth:=010;
  TDateField(_cdsItensPendentes.FieldByName('DT_PREVISAO')).DisplayFormat:='dd/mm/yyyy';


  TDateField(_cdsItensPendentes.FieldByName('DT_AGENDAMENTO')).DisplayLabel:='Agenda Descarga';
  TDateField(_cdsItensPendentes.FieldByName('DT_AGENDAMENTO')).DisplayWidth:=010;
  //TDateField(_cdsItensPendentes.FieldByName('DT_AGENDAMENTO')).DisplayFormat:='dd/mm/yyyy';



  TIntegerField(_cdsItensPendentes.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd.Pedido';
  TIntegerField(_cdsItensPendentes.FieldByName('QT_PEDIDO')).DisplayWidth:=008;

  TIntegerField(_cdsItensPendentes.FieldByName('NR_NFE_FORNECEDOR')).DisplayLabel:='nr.Nfe ';
  TIntegerField(_cdsItensPendentes.FieldByName('NR_NFE_FORNECEDOR')).DisplayWidth:=009;



  TIntegerField(_cdsItensPendentes.FieldByName('QT_MERCADORIA')).DisplayLabel:='Qtd.Agendada';
  TIntegerField(_cdsItensPendentes.FieldByName('QT_MERCADORIA')).DisplayWidth:=008;
  TIntegerField(_cdsItensPendentes.FieldByName('QT_MERCADORIA')).DisplayFormat:='#,###,##0';



  TFloatField(_cdsItensPendentes.FieldByName('VL_PEDIDO')).DisplayLabel:='Vlr.Pedido';
  TFloatField(_cdsItensPendentes.FieldByName('VL_PEDIDO')).DisplayWidth:=010;
  TFloatField(_cdsItensPendentes.FieldByName('VL_PEDIDO')).DisplayFormat:='###,##0.00';




  TFloatField(_cdsItensPendentes.FieldByName('VL_ATENDIDO')).DisplayLabel:='Vlr.Atendido';
  TFloatField(_cdsItensPendentes.FieldByName('VL_ATENDIDO')).DisplayWidth:=010;
  TFloatField(_cdsItensPendentes.FieldByName('VL_ATENDIDO')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsItensPendentes.FieldByName('VL_TRANSITO')).DisplayLabel:='Vlr.Transito';
  TFloatField(_cdsItensPendentes.FieldByName('VL_TRANSITO')).DisplayWidth:=010;
  TFloatField(_cdsItensPendentes.FieldByName('VL_TRANSITO')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsItensPendentes.FieldByName('VL_PENDENTE')).DisplayLabel:='Vlr.Pendente';
  TFloatField(_cdsItensPendentes.FieldByName('VL_PENDENTE')).DisplayWidth:=010;
  TFloatField(_cdsItensPendentes.FieldByName('VL_PENDENTE')).DisplayFormat:='###,##0.00';


  TIntegerField(_cdsItensPendentes.FieldByName('QT_ATENDIDA')).DisplayLabel:='Qtd.Atendida Ped.';
  TIntegerField(_cdsItensPendentes.FieldByName('QT_ATENDIDA')).DisplayWidth:=012;

  TIntegerField(_cdsItensPendentes.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Produto';
  TIntegerField(_cdsItensPendentes.FieldByName('CD_PRODUTO')).DisplayWidth:=008;

  TStringField(_cdsItensPendentes.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
  TStringField(_cdsItensPendentes.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsItensPendentes.FieldByName('DS_APRESENTACAO')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsItensPendentes.FieldByName('DS_APRESENTACAO')).DisplayWidth:=30;

  TStringField(_cdsItensPendentes.FieldByName('ID_ITEM')).DisplayLabel:='Id.Item';
  TStringField(_cdsItensPendentes.FieldByName('ID_ITEM')).DisplayWidth:=03;

  TStringField(_cdsItensPendentes.FieldByName('ID_CAPA')).DisplayLabel:='Id.Capa';
  TStringField(_cdsItensPendentes.FieldByName('ID_CAPA')).DisplayWidth:=03;

  TStringField(_cdsItensPendentes.FieldByName('ID_CD')).DisplayLabel:='CD';
  TStringField(_cdsItensPendentes.FieldByName('ID_CD')).DisplayWidth:=02;

  TIntegerField(_cdsItensPendentes.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsItensPendentes.FieldByName('CD_COMPRADOR')).DisplayWidth:=005;


  TStringField(_cdsItensPendentes.FieldByName('NM_COMPRADOR')).DisplayLabel:='Comprador';
  TStringField(_cdsItensPendentes.FieldByName('NM_COMPRADOR')).DisplayWidth:=25;

  TFloatField(_cdsItensPendentes.FieldByName('DADY_Y')).DisplayLabel:='Desc.Adic.';
  TFloatField(_cdsItensPendentes.FieldByName('DADY_Y')).DisplayWidth:=006;
  TFloatField(_cdsItensPendentes.FieldByName('DADY_Y')).DisplayFormat:='##0.00';

  TFloatField(_cdsItensPendentes.FieldByName('ABTY_Y')).DisplayLabel:='Desc.Padr?o';
  TFloatField(_cdsItensPendentes.FieldByName('ABTY_Y')).DisplayWidth:=006;
  TFloatField(_cdsItensPendentes.FieldByName('ABTY_Y')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsItensPendentes.FieldByName('PUNY_Y')).DisplayLabel:='Pre?o Unit.Custo';
  TFloatField(_cdsItensPendentes.FieldByName('PUNY_Y')).DisplayWidth:=006;
  TFloatField(_cdsItensPendentes.FieldByName('PUNY_Y')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsItensPendentes.FieldByName('PFBY_Y')).DisplayLabel:='Pre?o Fornecedor';
  TFloatField(_cdsItensPendentes.FieldByName('PFBY_Y')).DisplayWidth:=006;
  TFloatField(_cdsItensPendentes.FieldByName('PFBY_Y')).DisplayFormat:='###,##0.00';


  TIntegerField(_cdsItensPendentes.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsItensPendentes.FieldByName('NRVV_Y')).DisplayWidth:=005;

  TIntegerField(_cdsItensPendentes.FieldByName('NROM_Y')).Visible:=FALSE;


  TIntegerField(_cdsItensPendentes.FieldByName('qt_mercadoria_entrada')).DisplayLabel:='Qtd. Em Transito';
  TIntegerField(_cdsItensPendentes.FieldByName('qt_mercadoria_entrada')).DisplayWidth:=005;

  TIntegerField(_cdsItensPendentes.FieldByName('nr_nfe')).DisplayLabel:='Nr. Nfe';
  TIntegerField(_cdsItensPendentes.FieldByName('nr_nfe')).DisplayWidth:=005;

  TIntegerField(_cdsItensPendentes.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd. Pendente';
  TIntegerField(_cdsItensPendentes.FieldByName('QT_PENDENTE')).DisplayWidth:=10;
  TIntegerField(_cdsItensPendentes.FieldByName('QT_PENDENTE')).DisplayFormat:='#,###,##0';

  TStringField(_cdsItensPendentes.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Item em Transito';
  TStringField(_cdsItensPendentes.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=10;

  TIntegerField(_cdsItensPendentes.FieldByName('QT_ITEM_PEDIDO_CRITICA')).DisplayLabel:='Qtd. Em Critica';
  TIntegerField(_cdsItensPendentes.FieldByName('QT_ITEM_PEDIDO_CRITICA')).DisplayWidth:=10;
  TIntegerField(_cdsItensPendentes.FieldByName('QT_ITEM_PEDIDO_CRITICA')).DisplayFormat:='#,###,##0';



end;


Procedure T_frmPendenciaComprador.EliminaPendenciaItem;
var
  idMarcadorCapa :TBookmark;
begin
   idMarcadorCapa:=_cdsItensPendentes.Bookmark;
   if Confirma('Deseja Eliminar item da Pendencia?',MB_DEFBUTTON1)=IDYES then
   begin
    if  (_cdsItensPendentes.FieldByName('ID_NFE_TRANSITO').AsString='S')then
    begin
     if GetStatusNfe(_cdsItensPendentes.FieldByName('NR_PEDIDO').AsInteger,
                        _cdsItensPendentes.FieldByName('NROM_Y').AsInteger)    then
     begin
         Mensagem('Este Item J? Foi Faturado No Fornecedor!!!'+#13+
                  'N?o pode ser excluida!!!',MB_ICONWARNING);
                           exit;

        end;
    end;

   AlteraStatusItemPedido(_cdsItensPendentes.FieldByName('NR_PEDIDO').AsInteger,
                           _cdsItensPendentes.FieldByName('NROM_Y').AsInteger,
                           _cdsItensPendentes.FieldByName('CD_EMPRESA').AsInteger,nmLogin);

   _cdsItensPendentes.Edit;
   _cdsItensPendentes.FieldByName('ID_ITEM').AsString:='C';
   filtraPendencia;
   end;

  //AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);
  //AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
 // AbreItensPendendtes;
// _cdsItensPendentes.First;
 // if _cdsItensPendentes.RecordCount>1 then
  //   _cdsItensPendentes.Bookmark:=idMarcadorCapa;

end;


procedure T_frmPendenciaComprador.EliminaTodasPendenciaListada;
var
  idMarcadorCapa :TBookmark;
begin
   idMarcadorCapa:=_cdsItensPendentes.Bookmark;
   if Confirma('Deseja Eliminar Todas as Pendencias Listadas?',MB_DEFBUTTON1)=IDYES then
   begin
     _cdsItensPendentes.First;
     while not _cdsItensPendentes.Eof do
     begin

       if (_cdsItensPendentes.FieldByName('ID_NFE_TRANSITO').AsString<>'S') or
          (_cdsItensPendentes.FieldByName('QT_MERCADORIA_ENTRADA').AsInteger=0)    then
        begin

        AlteraStatusItemPedido(_cdsItensPendentes.FieldByName('NR_PEDIDO').AsInteger,
                               _cdsItensPendentes.FieldByName('NROM_Y').AsInteger,
                               _cdsItensPendentes.FieldByName('CD_EMPRESA').AsInteger,
                               nmLogin);
        end;
       _cdsItensPendentes.Next;
     end;
   end;


  AbreItensPendendes;

end;


procedure T_frmPendenciaComprador.AbreItensPendendes;
var
 PnrPedido,nrRede,
 nrProduto:Integer;
begin
      if _cdsItensPendentes<>nil then
         _cdsItensPendentes.close;

     Application.ProcessMessages;

     nrRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,3),0);

    nrCompradorPendencia:=StrToIntDef(_edtNrComprador.Text,0);
    nrFornecedorPendencia:=StrToIntDef(_edtNrFornecedor.Text,0);
    PnrPedido            :=StrToIntDef(_edtNrPedido.Text,0);
    nrProduto            :=StrToIntDef(copy(formatfloat('00000000',StrToIntDef(_edtNrProduto.Text,0)),1,7),0);


    if _cdsItensPendentes<>nil then
       _cdsItensPendentes.Close;
   _cdsItensPendentes:=AbrePendenciaComprador(nrFornecedorPendencia,nrCompradorPendencia,0,PnrPedido,nrProduto,_chkItensNaoFaturados.Checked,false,nrRede);
   if _cdsItensPendentes<>nil then
   begin
     _dsItensPendentes.DataSet:=_cdsItensPendentes;
     _cdsItensPendentes.IndexFieldNames:='NR_FORNCEDOR;DT_PEDIDO';
     _cdsItensPendentes.Open;
     _cdsItensPendentes.First;
     setGridItemPendente;
    _cdsItensPendentes.First;
   end
   else
   begin

    Mensagem('Pendencia n?o Encontrada !!!',MB_ICONWARNING);
    exit;

   end;
end;

procedure T_frmPendenciaComprador.mouseToCell(X, Y: integer; var ACol, ARow: Integer);

var
   Coord: TGridCoord;
begin
   Coord := _dbgItemPendentes.MouseCoord(X,Y);
   ACol := Coord.X;
ARow := Coord.Y;
end;


{procedure TMinhaJanelaHint.doActivateHint(Sender: TObject);

var
   r : TRect;
   wdth_hint, hght_hint : integer;
begin
   if (Sender is TDbGrid) then
   begin
      // Calculo as dimens?es necess?rias ? janela de Hint sendo o limite igual ? 1/3 da tela
      r := CalcHintRect((Screen.Width div 3), (Sender as TDbGrid).Hint, nil);
      wdth_hint := r.Right - r.Left;
      hght_hint := r.Bottom - r.Top;

      // Reposiciono a janela do Hint para pr?ximo da posi??o do mouse mantendo o tamanho
      // calculado pela rotina anterior
      r.Left := r.Left + mouse.CursorPos.X + 16;
      r.Top := r.Top + mouse.CursorPos.Y + 16;
      r.Right := r.Left + wdth_hint;
      r.Bottom := r.Top + hght_hint;
      // Executo o procedimento para exibi??o do Hint na tela

      ActivateHint(r,(Sender as TDbGrid).Hint);
   end;
end;}

procedure T_frmPendenciaComprador.CarregaOperacaoRede;
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

     _cbxOperacaoRede.Clear;

     _cbxOperacaoRede.Items.Add(FormatFloat('000',0)+' - '+
                                  FormatFloat('000',0)+' - '+
                                  'Todos' );

    while not tempQuery.eof do
    begin
       _cbxOperacaoRede.Items.Add(FormatFloat('000',tempQuery.FieldByName('cd_empresa').AsInteger)+' - '+
                                  FormatFloat('000',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOperacaoRede.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;



procedure T_frmPendenciaComprador.filtraPendencia;
begin
 if _cdsItensPendentes<>nil then
 begin
  if _cdsItensPendentes.Active then
      with _cdsItensPendentes DO
      begin
       filter:='ID_ITEM<>''C''';
       Filtered:=TRUE;
      end;
 end;
end;

end.

