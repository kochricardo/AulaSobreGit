unit uProdutoEmEspera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, DB, DBClient;

type
  T_frmProdutoEmEspera = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    _dbgProduto: TDBGrid;
    DBGrid2: TDBGrid;
    _btnCancela: TBitBtn;
    _cdsProdutoEmEspera: TClientDataSet;
    _cdsClientePedidoEspera: TClientDataSet;
    _dsProdutoEmeEspera: TDataSource;
    _dsClientePedidoEspera: TDataSource;
    GroupBox3: TGroupBox;
    _edtNrFornecedor: TEdit;
    Label3: TLabel;
    _edtNrComprador: TEdit;
    Label4: TLabel;
    _edtNomeFornecedor: TEdit;
    Label5: TLabel;
    _edtNomeComprador: TEdit;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    procedure _btnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure _dbgProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgProdutoDblClick(Sender: TObject);
    procedure _dbgProdutoColEnter(Sender: TObject);
    procedure _edtNrCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure _dbgProdutoTitleClick(Column: TColumn);
  private
    procedure setGridProdutoEspera;
    procedure AbreClienteEspera(PcdProduto: Integer);
    procedure setGridClienteEspera;
    procedure AbreProdutosEmEspera;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmProdutoEmEspera: T_frmProdutoEmEspera;

implementation

uses uRotinasGenericas, uAuxiliarCompras;



{$R *.dfm}

procedure T_frmProdutoEmEspera._dbgProdutoColEnter(Sender: TObject);
begin
  if _cdsClientePedidoEspera<>nil then
    _cdsClientePedidoEspera.Close;

end;

procedure T_frmProdutoEmEspera._dbgProdutoDblClick(Sender: TObject);
begin
  AbreClienteEspera(_cdsProdutoEmEspera.FieldByName('COD_PRODUTO').AsInteger);
end;

procedure T_frmProdutoEmEspera._dbgProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 with _dbgProduto do
 begin
    if _cdsProdutoEmEspera=nil then
       exit;

      if odd(_cdsProdutoEmEspera.RecNo) then
    begin
      _dbgProduto.Canvas.Font.Color  := clBlack;
      _dbgProduto.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgProduto.Canvas.Font.Color  := clBlack;
      _dbgProduto.Canvas.Brush.Color := clWhite;
   end;

// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
   {   if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clYellow;
         Canvas.Font.Color:= clBlue;
      end;}

      DefaultDrawColumnCell(Rect,DataCol,Column,state);

   end;


end;

procedure T_frmProdutoEmEspera._dbgProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
     VK_RETURN : AbreClienteEspera(_cdsProdutoEmEspera.FieldByName('COD_PRODUTO').AsInteger);
  end;
end;

procedure T_frmProdutoEmEspera._dbgProdutoTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsProdutoEmEspera,Column);
end;

procedure T_frmProdutoEmEspera._edtNrCompradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  DadosComprador :TDadosComprador;
begin
 case Key of
   VK_RETURN :begin
               DadosComprador :=AbreDadosComprador(strtointdef(_edtNrComprador.Text,0));
               if DadosComprador.nrComprador=0 then
               begin
                 _edtNomeComprador.Text:='Comprador n?o Localizado...';
               end;
              if DadosComprador.nrComprador>0 then
                 _edtNomeComprador.Text:=DadosComprador.nmCompradorReduzido;

   end;
 end;
end;

procedure T_frmProdutoEmEspera._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
VAR
  DadosFornecedor :TDescricaoFornecedor;
begin
 case Key of
   VK_RETURN :begin
               DadosFornecedor :=AbreDadosFornecedor(strtointdef(_edtNrFornecedor.Text,0));
               if DadosFornecedor.nr_Fornecedor=0 then
               begin
                 _edtNomeFornecedor.Text:='Fornecedor n?o Localizado...';
               end;
              if DadosFornecedor.nr_Fornecedor>0 then
                 _edtNomeFornecedor.Text:=DadosFornecedor.nm_Fornecedor;

   end;
 end;

end;

procedure T_frmProdutoEmEspera.FormActivate(Sender: TObject);
begin
  AbreProdutosEmEspera;
end;

procedure T_frmProdutoEmEspera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmProdutoEmEspera._btnCancelaClick(Sender: TObject);
begin
 close;
end;

procedure T_frmProdutoEmEspera.setGridProdutoEspera;
begin

  TIntegerField(_cdsProdutoEmEspera.FieldByName('COD_PRODUTO')).DisplayLabel:='Cod.Produto';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('COD_PRODUTO')).DisplayWidth:=8;

  TStringField(_cdsProdutoEmEspera.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsProdutoEmEspera.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsProdutoEmEspera.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsProdutoEmEspera.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

  TIntegerField(_cdsProdutoEmEspera.FieldByName('QTPEDIDO')).DisplayLabel:='Qtd.Pedido';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('QTPEDIDO')).DisplayWidth:=8;

  TIntegerField(_cdsProdutoEmEspera.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr. Comprador';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('CD_COMPRADOR')).DisplayWidth:=8;

  TStringField(_cdsProdutoEmEspera.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Comprador';
  TStringField(_cdsProdutoEmEspera.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=30;

  TIntegerField(_cdsProdutoEmEspera.FieldByName('CD')).DisplayLabel:='CD';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('CD')).DisplayWidth:=05;
//
  TIntegerField(_cdsProdutoEmEspera.FieldByName('ESTOQUE')).DisplayLabel:='Qtd.Estoque';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('ESTOQUE')).DisplayWidth:=08;
  TIntegerField(_cdsProdutoEmEspera.FieldByName('ESTOQUE')).DisplayFormat:='###,###,##0';

  TIntegerField(_cdsProdutoEmEspera.FieldByName('QT_RESERVADO')).DisplayLabel:='Qtd.Reservado';
  TIntegerField(_cdsProdutoEmEspera.FieldByName('QT_RESERVADO')).DisplayWidth:=08;
  TIntegerField(_cdsProdutoEmEspera.FieldByName('QT_RESERVADO')).DisplayFormat:='###,###,##0';

end;

procedure T_frmProdutoEmEspera.setGridClienteEspera;
begin

  TIntegerField(_cdsClientePedidoEspera.FieldByName('NROO_O')).DisplayLabel:='Nr. Pedido';
  TIntegerField(_cdsClientePedidoEspera.FieldByName('NROO_O')).DisplayWidth:=8;

  TIntegerField(_cdsClientePedidoEspera.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd.Pedido';
  TIntegerField(_cdsClientePedidoEspera.FieldByName('QT_PEDIDO')).DisplayWidth:=8;

  TIntegerField(_cdsClientePedidoEspera.FieldByName('NROC_C*10+DIGC_C')).DisplayLabel:='Cod.Cliente';
  TIntegerField(_cdsClientePedidoEspera.FieldByName('NROC_C*10+DIGC_C')).DisplayWidth:=8;

  TStringField(_cdsClientePedidoEspera.FieldByName('NOMP_P')).DisplayLabel:='Raz?o Social';
  TStringField(_cdsClientePedidoEspera.FieldByName('NOMP_P')).DisplayWidth:=35;

  TDateField(_cdsClientePedidoEspera.FieldByName('DT_INICIO_PEDIDO')).DisplayLabel:='Dt. Reserva';
  TDateField(_cdsClientePedidoEspera.FieldByName('DT_INICIO_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsClientePedidoEspera.FieldByName('DT_INICIO_PEDIDO')).DisplayWidth:=10;

  TDateField(_cdsClientePedidoEspera.FieldByName('DATO_O')).DisplayLabel:='Reservado At?';
  TDateField(_cdsClientePedidoEspera.FieldByName('DATO_O')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsClientePedidoEspera.FieldByName('DATO_O')).DisplayWidth:=10;

  TStringField(_cdsClientePedidoEspera.FieldByName('SNRO_O')).DisplayLabel:='Reservado Por';
  TStringField(_cdsClientePedidoEspera.FieldByName('SNRO_O')).DisplayWidth:=15;
end;

procedure T_frmProdutoEmEspera.AbreClienteEspera(PcdProduto:Integer);
begin
   _cdsClientePedidoEspera:=ClientesComPedidoEmEspera(PcdProduto);
   if _cdsClientePedidoEspera<>nil then
   begin
      _dsClientePedidoEspera.DataSet:=_cdsClientePedidoEspera;
      _cdsClientePedidoEspera.Open;
      setGridClienteEspera;
   end;
end;
procedure T_frmProdutoEmEspera.AbreProdutosEmEspera;
var
 nrFornecedor,nrComprador:Integer;
begin
   _cdsProdutoEmEspera.close;
   nrFornecedor:=StrToIntDef(_edtNrFornecedor.Text,0);
   nrComprador:=StrToIntDef(_edtNrComprador.Text,0);
   _cdsProdutoEmEspera:=ProdutosEmEspera(nrFornecedor,nrComprador);
   if _cdsProdutoEmEspera<>nil then
   begin
     _dsProdutoEmeEspera.DataSet:=_cdsProdutoEmEspera;
     _cdsProdutoEmEspera.Open;
     setGridProdutoEspera;
   end;

end;
procedure T_frmProdutoEmEspera.BitBtn1Click(Sender: TObject);
begin
 AbreProdutosEmEspera;
end;

end.
