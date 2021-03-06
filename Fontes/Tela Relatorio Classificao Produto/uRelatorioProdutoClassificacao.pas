unit uRelatorioProdutoClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, uAuxiliarCompras, DB, DBClient,
  CheckLst, Buttons, uRotinasGenericas;

type
  T_frmRelatorioClassificacaoProduto = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _dbgProduto: TDBGrid;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    _cdsProdutos: TClientDataSet;
    _clbTipo: TCheckListBox;
    _clbSubTipo: TCheckListBox;
    _clbCategoria: TCheckListBox;
    _cdsTipoProduto: TClientDataSet;
    _dsTipoProduto: TDataSource;
    _dbgTipoProduto: TDBGrid;
    _cdsSubTipoProduto: TClientDataSet;
    _dsSubTipoProduto: TDataSource;
    _dbgSubTipo: TDBGrid;
    _cdsCategoria: TClientDataSet;
    _dsCategoria: TDataSource;
    _dbgCategoria: TDBGrid;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    _dsProdutos: TDataSource;
    _edtNrFornecedor: TEdit;
    Label1: TLabel;
    _edtNrComprador: TEdit;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure _clbTipoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure _clbTipoClickCheck(Sender: TObject);
    procedure _clbSubTipoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure _clbSubTipoClickCheck(Sender: TObject);
    procedure _clbCategoriaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure _dbgTipoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgTipoProdutoDblClick(Sender: TObject);
    procedure _dbgTipoProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgSubTipoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgSubTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgSubTipoDblClick(Sender: TObject);
    procedure _dbgCategoriaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnExecutaClick(Sender: TObject);
    procedure _dbgProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgCategoriaDblClick(Sender: TObject);
    procedure _dbgCategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgProdutoTitleClick(Column: TColumn);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MontaTipoProduto;
    function PercorreListaTipo: String;
    function CarregaSubTipoProduto(PstSubTipo: String): String;
    function PercorreListaSubTipo: String;
    function CarregaListaCategoria(PstCategoria: String): String;
    procedure SetTipoProduto;
    procedure SetSelecaoTipo;
    function PercorreListaTipoII: String;
    procedure SetSubTipoProduto;
    procedure SetSelecaoSubTipo;
    function PercorreListaSubTipoII: String;
    procedure SetGridCategoria;
    procedure SetGridProduto;
    procedure SetSelecaoCategoria;
    function PercorreListaCategoria: String;
    { Private declarations }
  public
    { Public declarations }
    stVencidosBloqueados:String;
    nrCDClassificacao:Integer;
  end;

var
  _frmRelatorioClassificacaoProduto: T_frmRelatorioClassificacaoProduto;

implementation

{$R *.dfm}


procedure T_frmRelatorioClassificacaoProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmRelatorioClassificacaoProduto.FormShow(Sender: TObject);
begin
   MontaTipoProduto;
end;

procedure T_frmRelatorioClassificacaoProduto.MontaTipoProduto;
var
// _cdsTipoProduto:TClientDataSet;
 nrSequencia :Integer;
begin

 //_cdsTipoProduto:=TClientDataSet.Create(nil);
 _cdsTipoProduto:=GetListaTipoProduto(2);
 _dsTipoProduto.DataSet:=_cdsTipoProduto;
 _cdsTipoProduto.oPEN;
  SetTipoProduto;
{ with _cdsTipoProduto do
 begin
   close;
   open;
   First;
 end;}
 nrSequencia:=0;
 _clbTipo.Clear;
 _clbTipo.Items.Add('BLOQUEADOS');
 _clbTipo.Items.Add('VENCIDOS');
 while not _cdsTipoProduto.Eof do
 begin
    Inc(nrSequencia);
   _clbTipo.Items.Add(_cdsTipoProduto.FieldByName('CD_ESTRUTURA').AsString+'-'+_cdsTipoProduto.FieldByName('DS_ESTRUTURA').AsString);
   _clbTipo.Checked[nrSequencia]:=false;
   _cdsTipoProduto.Next;
 end;
end;

function T_frmRelatorioClassificacaoProduto.CarregaSubTipoProduto(PstSubTipo:String):String;
var
// _cdsSubTipoProduto:TClientDataSet;
 nrSequencia :Integer;
begin

 _cdsSubTipoProduto:=TClientDataSet.Create(nil);
 _cdsSubTipoProduto:=GetListaSubTipoProduto(4,PstSubTipo);
 _dsSubTipoProduto.DataSet:=_cdsSubTipoProduto;
 _cdsSubTipoProduto.IndexFieldNames:='ID_TIPO;DS_ESTRUTURA';
 SetSubTipoProduto;

 with _cdsSubTipoProduto do
 begin
//   close;
   open;
   First;
 end;
 nrSequencia:=0;
 _clbSubTipo.Clear;
 {while not _cdsSubTipoProduto.Eof do
 begin
   _clbSubTipo.Items.Add(_cdsSubTipoProduto.FieldByName('DS_ESTRUTURA').AsString+'-'+_cdsSubTipoProduto.FieldByName('DS_DESCRICAO_ESTRUTURA').AsString);
   _clbSubTipo.Checked[nrSequencia]:=false;
    Inc(nrSequencia);
   _cdsSubTipoProduto.Next;
 end;}
end;

procedure T_frmRelatorioClassificacaoProduto._dbgProdutoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgProduto do
  begin
    if  'P'=_cdsProdutos.FieldByName('ID_TIPO').AsString then
    begin
    Canvas.Font.Color:= clBlue;
    Canvas.Brush.Color:= clWhite;
    end;
    if  'M'=_cdsProdutos.FieldByName('ID_TIPO').AsString then
    begin
     Canvas.Font.Color := clRed;
     Canvas.Brush.Color := clWhite;
    end;
    if  'O'=_cdsProdutos.FieldByName('ID_TIPO').AsString then
    begin
     Canvas.Font.Color := clgreen;
     Canvas.Brush.Color := clWhite;
    end;

 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmRelatorioClassificacaoProduto._dbgProdutoTitleClick(
  Column: TColumn);
begin
  GeraOrdenacao(_cdsProdutos,Column);
end;

procedure T_frmRelatorioClassificacaoProduto._dbgCategoriaDblClick(
  Sender: TObject);
begin
 SetSelecaoCategoria;
end;

procedure T_frmRelatorioClassificacaoProduto._dbgCategoriaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgCategoria do
  begin
    if  '02'=copy((_cdsCategoria.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
    Canvas.Font.Color:= clBlue;
    Canvas.Brush.Color:= clWhite;
    end;
    if  '01'=copy((_cdsCategoria.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clRed;
     Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_cdsCategoria.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clgreen;
     Canvas.Brush.Color := clWhite;
    end;

 if (Column.Field.FieldName = 'DS_ESTRUTURA') then
 begin
   if( _cdsCategoria.FieldByName('ID_SELECIONADO').AsString='S')then
   begin
      Canvas.brush.Color:= clGreen;
      Canvas.Font.Color:= clwhite;
   end;
 end;
  DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmRelatorioClassificacaoProduto._dbgCategoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:SetSelecaoCategoria;
  end;
end;

procedure T_frmRelatorioClassificacaoProduto.BitBtn2Click(Sender: TObject);
begin
 close;
end;

function T_frmRelatorioClassificacaoProduto.CarregaListaCategoria(PstCategoria:String):String;
var
// _cdsCategoria:TClientDataSet;
 nrSequencia :Integer;
begin

 _cdsCategoria:=TClientDataSet.Create(nil);
 _cdsCategoria:=GetListaCategoria(6,PstCategoria);
 _dsCategoria.DataSet:=_cdsCategoria;
 with _cdsCategoria do
 begin
//   close;
   open;
   First;
 end;
 SetGridCategoria;
 _cdsCategoria.IndexFieldNames:='ID_TIPO;DS_ESTRUTURA';
 _cdsCategoria.first;
 nrSequencia:=0;
 _clbCategoria.Clear;
{ while not _cdsCategoria.Eof do
 begin
   _clbCategoria.Items.Add(_cdsCategoria.FieldByName('DS_ESTRUTURA').AsString+'-'+_cdsCategoria.FieldByName('DS_DESCRICAO_ESTRUTURA').AsString);
   _clbCategoria.Checked[nrSequencia]:=false;
    Inc(nrSequencia);
   _cdsCategoria.Next;
 end;}
end;

procedure T_frmRelatorioClassificacaoProduto._btnExecutaClick(Sender: TObject);
Var
 nrFornecedor,
 nrComprador:Integer;
 stFiltroTipo,
 stFiltroSubTipo,
 stFiltroCategoria:String;
begin
     nrCDClassificacao:=1;
     if _cbxOpcaoCDs.ItemIndex=1 then
         nrCDClassificacao:=4;

     stFiltroTipo:=PercorreListaTipoII;
     stFiltroSubTipo:=PercorreListaSubTipoII;
     stFiltroCategoria:=PercorreListaCategoria;
     nrFornecedor:=StrToIntDef(_edtNrFornecedor.Text,0);
     nrComprador:=StrToIntDef(_edtNrComprador.Text,0);
    if _cdsProdutos<>nil then
       _cdsProdutos.Close;
    _cdsProdutos:=GetProdutoPorClassificacao(0,nrFornecedor,nrComprador,nrCDClassificacao,stFiltroTipo,stFiltroSubTipo,stFiltroCategoria);
    if _cdsProdutos<>nil then
    begin
     _dsProdutos.DataSet:=_cdsProdutos;
     _cdsProdutos.IndexFieldNames:='NR_COMPRADOR;NR_LABORATORIO;NOME;APRESENTACAO';
     SetGridProduto;
     _cdsProdutos.Open;
     _cdsProdutos.First;
    if _cdsProdutos.Active  then
       StatusBar1.Panels[1].Text:='Nr.de Registros --> '+FormatFloat('###,###,##0',_cdsProdutos.RecordCount);
  end;
end;

procedure T_frmRelatorioClassificacaoProduto._btnParaExcelClick(
  Sender: TObject);
begin
  if not _cdsProdutos.IsEmpty then
     GerarExcel(_cdsProdutos);
end;

procedure T_frmRelatorioClassificacaoProduto._clbCategoriaDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 _clbCategoria.Canvas.FillRect(Rect);
 if _clbCategoria.Items.Count>0 then
 begin
   if not (odFocused in State) then
   begin
    if  '02'=copy((_clbCategoria.Items.Strings[index]),1,2) then
    begin
     _clbCategoria.Canvas.Font.Color := clBlue;
     _clbCategoria.Canvas.Brush.Color := clWhite;
    end;
    if  '01'=copy((_clbCategoria.Items.Strings[index]),1,2) then
    begin
     _clbCategoria.Canvas.Font.Color := clRed;
     _clbCategoria.Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_clbSubTipo.Items.Strings[index]),1,2) then
    begin
     _clbCategoria.Canvas.Font.Color := clgreen;
     _clbCategoria.Canvas.Brush.Color := clWhite;
    end;
   END;
    _clbCategoria.Canvas.TextOut(Rect.Left+2,Rect.Top,_clbCategoria.Items.Strings[Index]);
 end;

end;

procedure T_frmRelatorioClassificacaoProduto._clbSubTipoClickCheck(
  Sender: TObject);
var
  I: Integer;
 stListaCategoria:String;
begin
  stListaCategoria:=PercorreListaSubTipo;
  if stListaCategoria<>'' then
    CarregaListaCategoria(stListaCategoria);


end;

procedure T_frmRelatorioClassificacaoProduto._clbSubTipoDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 _clbSubTipo.Canvas.FillRect(Rect);
 if _clbSubTipo.Items.Count>0 then
 begin
   if not (odFocused in State) then
   begin
    if  '02'=copy((_clbSubTipo.Items.Strings[index]),1,2) then
    begin
     _clbSubTipo.Canvas.Font.Color := clBlue;
     _clbSubTipo.Canvas.Brush.Color := clWhite;
    end;
    if  '01'=copy((_clbSubTipo.Items.Strings[index]),1,2) then
    begin
     _clbSubTipo.Canvas.Font.Color := clRed;
     _clbSubTipo.Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_clbSubTipo.Items.Strings[index]),1,2) then
    begin
     _clbSubTipo.Canvas.Font.Color := clgreen;
     _clbSubTipo.Canvas.Brush.Color := clWhite;
    end;
   END;
    _clbSubTipo.Canvas.TextOut(Rect.Left+2,Rect.Top,_clbSubTipo.Items.Strings[Index]);
 end;

end;

procedure T_frmRelatorioClassificacaoProduto._clbTipoClickCheck(
  Sender: TObject);
var
 stListaSubTipo:String;
 i:Integer;
begin
  stListaSubTipo:=percorreListaTipo;
  if stListaSubTipo<>'' then
    CarregaSubTipoProduto(stListaSubTipo);
end;

procedure T_frmRelatorioClassificacaoProduto._clbTipoDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 _clbTipo.Canvas.FillRect(Rect);
 if _clbTipo.Items.Count>0 then
 begin

   if not (odFocused in State) then
   begin
    if  '02'=copy((_clbTipo.Items.Strings[index]),1,2) then
    begin
     _clbTipo.Canvas.Font.Color := clBlue;
     _clbTipo.Canvas.Brush.Color := clWhite;
    end;
    if  '01'=copy((_clbTipo.Items.Strings[index]),1,2) then
    begin
     _clbTipo.Canvas.Font.Color := clRed;
     _clbTipo.Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_clbTipo.Items.Strings[index]),1,2) then
    begin
     _clbTipo.Canvas.Font.Color := clgreen;
     _clbTipo.Canvas.Brush.Color := clWhite;
    end;
   END;
  _clbTipo.Canvas.TextOut(Rect.Left+2,Rect.Top,_clbTipo.Items.Strings[Index]);
 end;

end;

procedure T_frmRelatorioClassificacaoProduto._dbgSubTipoDblClick(
  Sender: TObject);
begin
SetSelecaoSubTipo;;
end;

procedure T_frmRelatorioClassificacaoProduto._dbgSubTipoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgSubTipo do
  begin
    if  '02'=copy((_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
    Canvas.Font.Color:= clBlue;
    Canvas.Brush.Color:= clWhite;
    end;
    if  '01'=copy((_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clRed;
     Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clgreen;
     Canvas.Brush.Color := clWhite;
    end;

 if (Column.Field.FieldName = 'DS_ESTRUTURA') then
 begin
   if( _cdsSubTipoProduto.FieldByName('ID_SELECIONADO').AsString='S')then
   begin
      Canvas.brush.Color:= clGreen;
      Canvas.Font.Color:= clwhite;
   end;
 end;
{ if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;}
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmRelatorioClassificacaoProduto._dbgSubTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   VK_RETURN:SetSelecaoSubTipo;
  end;
end;

procedure T_frmRelatorioClassificacaoProduto._dbgTipoProdutoDblClick(
  Sender: TObject);
begin
  SetSelecaoTipo;
end;

procedure T_frmRelatorioClassificacaoProduto._dbgTipoProdutoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgTipoProduto do
  begin
    if  '02'=copy((_cdsTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
    Canvas.Font.Color:= clBlue;
    Canvas.Brush.Color:= clWhite;
    end;
    if  '01'=copy((_cdsTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clRed;
     Canvas.Brush.Color := clWhite;
    end;
    if  '03'=copy((_cdsTipoProduto.FieldByName('CD_ESTRUTURA').AsString),1,2) then
    begin
     Canvas.Font.Color := clgreen;
     Canvas.Brush.Color := clWhite;
    end;

 if (Column.Field.FieldName = 'DS_ESTRUTURA') then
 begin
   if( _cdsTipoProduto.FieldByName('ID_SELECIONADO').AsString='S')then
   begin
      Canvas.brush.Color:= clGreen;
      Canvas.Font.Color:= clwhite;
   end;
 end;

{ if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;}
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmRelatorioClassificacaoProduto._dbgTipoProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN :SetSelecaoTipo;
  end;

end;

function T_frmRelatorioClassificacaoProduto.PercorreListaTipo:String;
var
  I: Integer;
  stSelecaoTipo:String;
begin
 stSelecaoTipo:='';
 stVencidosBloqueados:='';
 _clbSubTipo.Clear;
 for I :=0 to _clbTipo.Items.Count- 1 do
 begin
    if (I<2) and (_clbTipo.Checked[i]) then
    begin
     if _clbTipo.Checked[0] then
     begin
        stVencidosBloqueados:=stVencidosBloqueados + ' AND QT_RESERVA_PROBLEMATICA>0';
        if  _clbTipo.Checked[1] then
             stVencidosBloqueados:=stVencidosBloqueados + ' AND QT_VENCIDO VENCIDOS>0';
     end;
     if  (_clbTipo.Checked[1])  and (not _clbTipo.Checked[0]) then
         stVencidosBloqueados:=stVencidosBloqueados + ' AND QT_VENCIDO VENCIDOS>0';
    end;
    if (I>1) and (_clbTipo.Checked[i]) then
    begin
      if stSelecaoTipo<>'' then
         stSelecaoTipo:=stSelecaoTipo+',';
      stSelecaoTipo:=stSelecaoTipo+(copy((_clbTipo.Items.Strings[i]),1,2))
    end;
 end;
 Result:=stSelecaoTipo;
end;

function T_frmRelatorioClassificacaoProduto.PercorreListaTipoII:String;
var
  I: Integer;
  stSelecaoTipo:String;
begin
 stSelecaoTipo:='';
 stVencidosBloqueados:='';
 _clbSubTipo.Clear;
 _cdsTipoProduto.Filtered:=false;
 _cdsTipoProduto.Filter:='ID_SELECIONADO=''S''';
 _cdsTipoProduto.Filtered:=TRUE;
 _cdsTipoProduto.First;
 while not _cdsTipoProduto.Eof do
 begin
    if stSelecaoTipo<>'' then
        stSelecaoTipo:=stSelecaoTipo+',';
      stSelecaoTipo:=stSelecaoTipo+_cdsTipoProduto.FieldByName('CD_ESTRUTURA').AsString;
   _cdsTipoProduto.Next;
 end;
 Result:=stSelecaoTipo;
 _cdsTipoProduto.Filtered:=false;
 _cdsTipoProduto.First;


end;

function T_frmRelatorioClassificacaoProduto.PercorreListaSubTipo:String;
var
  I: Integer;
  stSelecaoTipo:String;
begin
 stSelecaoTipo:='';
 stVencidosBloqueados:='';
 _clbCategoria.Clear;
 for I :=0 to _clbSubTipo.Items.Count- 1 do
 begin
  if (_clbSubTipo.Checked[i]) then
  begin
      if stSelecaoTipo<>'' then
         stSelecaoTipo:=stSelecaoTipo+',';
      stSelecaoTipo:=stSelecaoTipo+(copy((_clbSubTipo.Items.Strings[i]),1,4))
  end;
 end;
 Result:=stSelecaoTipo;

end;
function T_frmRelatorioClassificacaoProduto.PercorreListaSubTipoII:String;
var
  I: Integer;
  stSelecaoTipo:String;
begin
 stSelecaoTipo:='';
 stVencidosBloqueados:='';
 _clbCategoria.Clear;
if _cdsSubTipoProduto.active then
begin
 _cdsSubTipoProduto.Filtered:=false;
 _cdsSubTipoProduto.Filter:='ID_SELECIONADO=''S''';
 _cdsSubTipoProduto.Filtered:=true;
 _cdsSubTipoProduto.First;
 while not _cdsSubTipoProduto.Eof do
 begin
      if stSelecaoTipo<>'' then
         stSelecaoTipo:=stSelecaoTipo+',';
      stSelecaoTipo:=stSelecaoTipo+_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA').AsString;
      _cdsSubTipoProduto.Next;
 end;
 _cdsSubTipoProduto.Filtered:=false;
 _cdsSubTipoProduto.First;
end;
 Result:=stSelecaoTipo;

end;
function T_frmRelatorioClassificacaoProduto.PercorreListaCategoria:String;
var
  I: Integer;
  stSelecaoTipo:String;
begin
 stSelecaoTipo:='';
 stVencidosBloqueados:='';
if _cdsCategoria.Active then
begin
   _cdsCategoria.Filtered:=false;
   _cdsCategoria.Filter:='ID_SELECIONADO=''S''';
   _cdsCategoria.Filtered:=true;
   _cdsCategoria.First;
   while not _cdsCategoria.Eof do
   begin
        if stSelecaoTipo<>'' then
           stSelecaoTipo:=stSelecaoTipo+',';
        stSelecaoTipo:=stSelecaoTipo+_cdsCategoria.FieldByName('CD_ESTRUTURA').AsString;
        _cdsCategoria.Next;
   end;
   _cdsCategoria.Filtered:=false;
   _cdsCategoria.First;
end;
 Result:=stSelecaoTipo;

end;

Procedure T_frmRelatorioClassificacaoProduto.SetTipoProduto;
begin

 TIntegerField(_cdsTipoProduto.FieldByName('CD_ESTRUTURA')).DisplayLabel:='Cod.Tipo';
 TIntegerField(_cdsTipoProduto.FieldByName('CD_ESTRUTURA')).DisplayWidth:=05;
 TStringField(_cdsTipoProduto.FieldByName('DS_ESTRUTURA')).DisplayLabel:='Descr. Tipo';
 TStringField(_cdsTipoProduto.FieldByName('DS_ESTRUTURA')).DisplayWidth:=20;
 TStringField(_cdsTipoProduto.FieldByName('ID_SELECIONADO')).Visible:=false;
end;
Procedure T_frmRelatorioClassificacaoProduto.SetSubTipoProduto;
begin

 TIntegerField(_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA')).DisplayLabel:='Cod.Tipo';
 TIntegerField(_cdsSubTipoProduto.FieldByName('CD_ESTRUTURA')).DisplayWidth:=05;
 TStringField(_cdsSubTipoProduto.FieldByName('DS_ESTRUTURA')).DisplayLabel:='Descr. Tipo';
 TStringField(_cdsSubTipoProduto.FieldByName('DS_ESTRUTURA')).DisplayWidth:=20;
 TStringField(_cdsSubTipoProduto.FieldByName('ID_SELECIONADO')).Visible:=false;
end;
Procedure T_frmRelatorioClassificacaoProduto.SetGridCategoria;
begin

 TIntegerField(_cdsCategoria.FieldByName('CD_ESTRUTURA')).DisplayLabel:='Cod.Tipo';
 TIntegerField(_cdsCategoria.FieldByName('CD_ESTRUTURA')).DisplayWidth:=05;
 TStringField(_cdsCategoria.FieldByName('DS_ESTRUTURA')).DisplayLabel:='Descr. Tipo';
 TStringField(_cdsCategoria.FieldByName('DS_ESTRUTURA')).DisplayWidth:=20;
 TStringField(_cdsCategoria.FieldByName('ID_SELECIONADO')).Visible:=false;
end;

Procedure T_frmRelatorioClassificacaoProduto.SetSelecaoTipo;
 var
 stListaSubTipo:String;
 i:Integer;

begin
        _cdsTipoProduto.Edit;
       if  _cdsTipoProduto.FieldByName('ID_SELECIONADO').AsString='S' then
           _cdsTipoProduto.FieldByName('ID_SELECIONADO').AsString:='N'
       else
         _cdsTipoProduto.FieldByName('ID_SELECIONADO').AsString:='S';
        _cdsTipoProduto.post;

  stListaSubTipo:=PercorreListaTipoII;
  if stListaSubTipo<>'' then
    CarregaSubTipoProduto(stListaSubTipo);
end;

Procedure T_frmRelatorioClassificacaoProduto.SetSelecaoSubTipo;
 var
 stListaSubTipo:String;
 i:Integer;

begin
        _cdsSubTipoProduto.Edit;
       if  _cdsSubTipoProduto.FieldByName('ID_SELECIONADO').AsString='S' then
           _cdsSubTipoProduto.FieldByName('ID_SELECIONADO').AsString:='N'
       else
         _cdsSubTipoProduto.FieldByName('ID_SELECIONADO').AsString:='S';
        _cdsSubTipoProduto.post;

  stListaSubTipo:=PercorreListaSubTipoII;
  if stListaSubTipo<>'' then
    CarregaListaCategoria(stListaSubTipo);
end;

Procedure T_frmRelatorioClassificacaoProduto.SetSelecaoCategoria;
 var
 stListaSubTipo:String;
 i:Integer;

begin
       _cdsCategoria.Edit;
       if  _cdsCategoria.FieldByName('ID_SELECIONADO').AsString='S' then
           _cdsCategoria.FieldByName('ID_SELECIONADO').AsString:='N'
       else
         _cdsCategoria.FieldByName('ID_SELECIONADO').AsString:='S';
        _cdsCategoria.post;

  stListaSubTipo:=PercorreListaCategoria;
  //if stListaSubTipo<>'' then
//    CarregaListaCategoria(stListaSubTipo);
end;



procedure T_frmRelatorioClassificacaoProduto.SetGridProduto;
begin
 TIntegerField(_cdsProdutos.FieldByName('NR_COMPRADOR')).DisplayLabel:='Comprador';
 TIntegerField(_cdsProdutos.FieldByName('NR_COMPRADOR')).DisplayWidth:=6;

 TStringField(_cdsProdutos.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
 TStringField(_cdsProdutos.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=15;

 TIntegerField(_cdsProdutos.FieldByName('NR_LABORATORIO')).DisplayLabel:='Nr.Fornec';
 TIntegerField(_cdsProdutos.FieldByName('NR_LABORATORIO')).DisplayWidth:=4;

 TStringField(_cdsProdutos.FieldByName('NOME_FORNECEDOR')).DisplayLabel:='Nome Forncedor';
 TStringField(_cdsProdutos.FieldByName('NOME_FORNECEDOR')).DisplayWidth:=20;

 TIntegerField(_cdsProdutos.FieldByName('CODIGO')).DisplayLabel:='Cod.Produto';
 TIntegerField(_cdsProdutos.FieldByName('CODIGO')).DisplayWidth:=8;

 TStringField(_cdsProdutos.FieldByName('NOME')).DisplayLabel:='Produto';
 TStringField(_cdsProdutos.FieldByName('NOME')).DisplayWidth:=30;

 TStringField(_cdsProdutos.FieldByName('ID_CD')).DisplayLabel:='CD';
 TStringField(_cdsProdutos.FieldByName('ID_CD')).DisplayWidth:=02;


 TStringField(_cdsProdutos.FieldByName('APRESENTACAO')).DisplayLabel:='Apresenta??o';
 TStringField(_cdsProdutos.FieldByName('APRESENTACAO')).DisplayWidth:=30;
//      ,
 TStringField(_cdsProdutos.FieldByName('DS_MERCADORIA')).DisplayLabel:='Nome Completo';
 TStringField(_cdsProdutos.FieldByName('DS_MERCADORIA')).DisplayWidth:=50;
 TStringField(_cdsProdutos.FieldByName('DS_MERCADORIA')).Index:=22;

 TIntegerField(_cdsProdutos.FieldByName('ESTOQUE')).DisplayLabel:='Estoque';
 TIntegerField(_cdsProdutos.FieldByName('ESTOQUE')).DisplayWidth:=8;
 TIntegerField(_cdsProdutos.FieldByName('ESTOQUE')).DisplayFormat:='##,###,##0';

 TIntegerField(_cdsProdutos.FieldByName('BLOQUEADOS')).DisplayLabel:='Qtd.Res.Probl.';
 TIntegerField(_cdsProdutos.FieldByName('BLOQUEADOS')).DisplayWidth:=8;
 TIntegerField(_cdsProdutos.FieldByName('BLOQUEADOS')).DisplayFormat:='##,###,##0';

 TIntegerField(_cdsProdutos.FieldByName('VENCIDOS')).DisplayLabel:='Qtd.Res.Vencidos';
 TIntegerField(_cdsProdutos.FieldByName('VENCIDOS')).DisplayWidth:=8;
 TIntegerField(_cdsProdutos.FieldByName('VENCIDOS')).DisplayFormat:='##,###,##0';

 TFloatField(_cdsProdutos.FieldByName('PRECO_FABRICA')).DisplayLabel:='P?o.Fornecedor';
 TFloatField(_cdsProdutos.FieldByName('PRECO_FABRICA')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('PRECO_FABRICA')).DisplayFormat:='##,###,##0.00';

 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE')).DisplayLabel:='Vlr.Estoque';
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE')).DisplayFormat:='##,###,##0.00';

 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_PROBLEMATICO')).DisplayLabel:='Vlr.Res.Probl.';
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_PROBLEMATICO')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_PROBLEMATICO')).DisplayFormat:='##,###,##0.00';

 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_VENCIDO')).DisplayLabel:='Vlr.Res.Probl.';
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_VENCIDO')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('VL_ESTOQUE_VENCIDO')).DisplayFormat:='##,###,##0.00';

 TStringField(_cdsProdutos.FieldByName('CATEGORIA')).DisplayLabel:='Categoria';
 TStringField(_cdsProdutos.FieldByName('CATEGORIA')).DisplayWidth:=25;

 TStringField(_cdsProdutos.FieldByName('CLASSIFICACAO')).DisplayLabel:='Classifica??o';
 TStringField(_cdsProdutos.FieldByName('CLASSIFICACAO')).DisplayWidth:=25;

 TStringField(_cdsProdutos.FieldByName('SUB_CLASSIFICACAO')).DisplayLabel:='Sub.Classifica??o';
 TStringField(_cdsProdutos.FieldByName('SUB_CLASSIFICACAO')).DisplayWidth:=25;

 TStringField(_cdsProdutos.FieldByName('ID_VENDA_MERCADO')).DisplayLabel:='Vda.Merc.';
 TStringField(_cdsProdutos.FieldByName('ID_VENDA_MERCADO')).DisplayWidth:=03;

 TFloatField(_cdsProdutos.FieldByName('VL_CUSTO_GERENCIAL')).DisplayLabel:='Vlr.Custo Geren.';
 TFloatField(_cdsProdutos.FieldByName('VL_CUSTO_GERENCIAL')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('VL_CUSTO_GERENCIAL')).DisplayFormat:='##,###,##0.00';

 TFloatField(_cdsProdutos.FieldByName('VL_PRECO_VENDA')).DisplayLabel:='P?o.Venda';
 TFloatField(_cdsProdutos.FieldByName('VL_PRECO_VENDA')).DisplayWidth:=12;
 TFloatField(_cdsProdutos.FieldByName('VL_PRECO_VENDA')).DisplayFormat:='##,###,##0.00';

 TStringField(_cdsProdutos.FieldByName('ID_TIPO')).DisplayLabel:='Tipo';
 TStringField(_cdsProdutos.FieldByName('ID_TIPO')).DisplayWidth:=03;


 end;

end.
