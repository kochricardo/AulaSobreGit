unit uPendenciaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, uRotinasGenericas, uSistemaCompras,
  ComCtrls, uAuxiliarCompras, StdCtrls;

type
  T_frmPendenciaItem = class(TForm)
    _cdsPendencia: TClientDataSet;
    _dsPendencia: TDataSource;
    _dbgPendencia: TDBGrid;
    StatusBar1: TStatusBar;
    _dsTemp: TDataSource;
    _edtQtdPedencia: TEdit;
    _edtQtdeProcessada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    _edtQtdTransito: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    _edtQtdCrossdocking: TEdit;
    Label5: TLabel;
    _edtQtdPedido: TEdit;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure _dbgPendenciaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPendenciaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   _cdsTemp : TClientDataSet;
    DadosPendenciaItem:TDadosPendenciaPedido;
   procedure setGridPendenciaItem;
  end;

var
  _frmPendenciaItem: T_frmPendenciaItem;

implementation

{$R *.dfm}

procedure T_frmPendenciaItem._dbgPendenciaDblClick(Sender: TObject);
begin
             if _cdsPendencia<>nil then
             begin
                   if Confirma('Deseja Eliminar item da Pendencia?',MB_DEFBUTTON1)=IDYES then
                     if AlteraStatusItemPedido(_cdsPendencia.FieldByName('NROP_y').AsInteger,
                                         _cdsPendencia.FieldByName('NROM_Y').AsInteger,
                                          _cdsPendencia.FieldByName('CD_EMPRESA').AsInteger,nmLogin) then

                      if _cdsTemp.Locate('CD_MERCADORIA',_cdsPendencia.FieldByName('NROM_Y').AsInteger,[]) THEN
                      begin
                         _cdsTemp.Edit;
                         _cdsTemp.FieldByName('QT_PENDENTE').AsFloat:=_cdsTemp.FieldByName('QT_PENDENTE').AsFloat-_cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;
                         if _cdsTemp.FieldByName('QT_PENDENTE').AsFloat<0 then
                           _cdsTemp.FieldByName('QT_PENDENTE').AsFloat:=0;
                         _cdsTemp.Post;
                         _cdsTemp.OPEN;
                         _cdsPendencia.Delete;
                         if _cdsPendencia.IsEmpty then
                             close;
                      end;
             end;


end;

procedure T_frmPendenciaItem._dbgPendenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(_dsPendencia.DataSet.RecNo) then
 begin
  _dbgPendencia.Canvas.Font.Color:= clBlack;
  _dbgPendencia.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPendencia.Canvas.Font.Color:= clBlack;
  _dbgPendencia.Canvas.Brush.Color:= clWhite;
 end;
 if _dsPendencia.DataSet.FieldByName('ID_NFE_TRANSITO').AsString='S' then
 begin
  _dbgPendencia.Canvas.Font.Color:= clWhite;
  _dbgPendencia.Canvas.Brush.Color:= clGreen;
 end;
 if (Column.Field.FieldName = 'ID_TIPO') then
 begin
  if _dsPendencia.DataSet.FieldByName('ID_TIPO').AsString='Bonif.' then
  begin
    _dbgPendencia.Canvas.brush.Color:= clBlue;
    _dbgPendencia.Canvas.Font.Color:= clwhite;
  end;
 end;
 if(gdFocused in State) then
 begin
    _dbgPendencia.Canvas.brush.Color:= clYellow;
    _dbgPendencia.     Canvas.Font.Color:= clblue;
 end;

 _dbgPendencia.Canvas.FillRect(Rect);
 _dbgPendencia.DefaultDrawDataCell(Rect,_dbgPendencia.columns[datacol].field, State);

end;

procedure T_frmPendenciaItem.FormActivate(Sender: TObject);
begin
 if  _cdsPendencia<>nil then
      if _cdsPendencia.ACTIVE then
           _cdsPendencia.Open;

   if _cdsTemp.Active then
   begin
     _dsTemp.DataSet:=_cdsTemp;
     _cdsTemp.Open;
   end;
   _edtQtdPedido.Text:=FormatFloat('###,##0',DadosPendenciaItem.QtPedido);
   _edtQtdPedencia.Text:=FormatFloat('###,##0',DadosPendenciaItem.qtPendencia);
   _edtQtdeProcessada.Text:=FormatFloat('###,##0',DadosPendenciaItem.qtProcessada);
   _edtQtdTransito.Text:=FormatFloat('###,##0',DadosPendenciaItem.qtTransito);
   _edtQtdCrossdocking.Text:=FormatFloat('###,##0',DadosPendenciaItem.qtEstoqueCrossdocking);
end;

procedure T_frmPendenciaItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmPendenciaItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
       VK_ESCAPE : close;
       VK_F5  : begin
                   if Confirma('Deseja Eliminar item da Pendencia?',MB_DEFBUTTON1)=IDYES then
                       if _cdsPendencia.FieldByName('ID_NFE_TRANSITO').AsString='S' then
                        begin
                        if Confirma('Este Item J? Foi Faturado No Laboratorio!!!'+#13+
                                  'Deseja Excluir  do Pedido',64)=idNo then
                                      exit;
                        end;

                        if AlteraStatusItemPedido(_cdsPendencia.FieldByName('NROP_y').AsInteger,
                                                  _cdsPendencia.FieldByName('NROM_Y').AsInteger,
                                                  _cdsPendencia.FieldByName('CD_EMPRESA').AsInteger,nmLogin) then

                      if _cdsTemp.Locate('NROM_Y',_cdsPendencia.FieldByName('NROM_Y').AsInteger,[]) THEN
                      begin
                         _cdsTemp.Edit;
                         _cdsTemp.FieldByName('QT_PENDENTE').AsFloat:=_cdsTemp.FieldByName('QT_PENDENTE').AsFloat-_cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;
                         _cdsTemp.Post;
                         _cdsTemp.OPEN;
                         _cdsPendencia.Delete;
                         if _cdsPendencia.IsEmpty then
                             close;
                      end;

                end;
   end;
end;


procedure T_frmPendenciaItem.setGridPendenciaItem;
begin
 TIntegerField(_cdsPendencia.FieldByName('NROP_Y')).DisplayLabel:='Nr.Pedido';
 TIntegerField(_cdsPendencia.FieldByName('NROP_Y')).DisplayWidth:=09;

 TDateField(_cdsPendencia.FieldByName('DATP_P')).DisplayLabel:='Dt.Pedido';
 TDateField(_cdsPendencia.FieldByName('DATP_P')).DisplayWidth:=10;
 TDateField(_cdsPendencia.FieldByName('DATP_P')).DisplayFormat:='dd/mm/yyyy';


 TDateField(_cdsPendencia.FieldByName('DT_AGENDAMENTO')).DisplayLabel:='Dt.Agendada';
 TDateField(_cdsPendencia.FieldByName('DT_AGENDAMENTO')).DisplayWidth:=10;
 TDateField(_cdsPendencia.FieldByName('DT_AGENDAMENTO')).DisplayFormat:='dd/mm/yyyy';


 TIntegerField(_cdsPendencia.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Produto';
 TIntegerField(_cdsPendencia.FieldByName('CD_PRODUTO')).DisplayWidth:=8;

 TIntegerField(_cdsPendencia.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd.pedido';
 TIntegerField(_cdsPendencia.FieldByName('QT_PEDIDO')).DisplayWidth:=08;


 TIntegerField(_cdsPendencia.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
 TIntegerField(_cdsPendencia.FieldByName('QT_PENDENTE')).DisplayWidth:=8;

 TFloatField(_cdsPendencia.FieldByName('VL_PENDENTE')).DisplayLabel:='Vlr.Pendente';
 TFloatField(_cdsPendencia.FieldByName('VL_PENDENTE')).DisplayWidth:=12;
 TFloatField(_cdsPendencia.FieldByName('VL_PENDENTE')).DisplayFormat:='###,###,##0.00';


 TFloatField(_cdsPendencia.FieldByName('QT_MERCADORIA_ENTRADA')).DisplayLabel:='Qtd.Em Transito';
 TFloatField(_cdsPendencia.FieldByName('QT_MERCADORIA_ENTRADA')).DisplayWidth:=12;
 TFloatField(_cdsPendencia.FieldByName('QT_MERCADORIA_ENTRADA')).DisplayFormat:='###,###,##0';

 TFloatField(_cdsPendencia.FieldByName('ABTY_Y')).DisplayLabel:='Desc.Padr?o';
 TFloatField(_cdsPendencia.FieldByName('ABTY_Y')).DisplayWidth:=10;
 TFloatField(_cdsPendencia.FieldByName('ABTY_Y')).DisplayFormat:='##0.00';

 TFloatField(_cdsPendencia.FieldByName('DADY_Y')).DisplayLabel:='Desc.Adic.';
 TFloatField(_cdsPendencia.FieldByName('DADY_Y')).DisplayWidth:=10;
 TFloatField(_cdsPendencia.FieldByName('DADY_Y')).DisplayFormat:='##0.00';

 TStringField(_cdsPendencia.FieldByName('ID_TIPO')).DisplayLabel:='Pedido';
 TStringField(_cdsPendencia.FieldByName('ID_TIPO')).DisplayWidth:=10;
 TStringField(_cdsPendencia.FieldByName('ID_TIPO')).Index:=1;

 TStringField(_cdsPendencia.FieldByName('SITY_Y')).DisplayLabel:='Status';
 TStringField(_cdsPendencia.FieldByName('SITY_Y')).DisplayWidth:=3;

 TStringField(_cdsPendencia.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Nfe Emitida';
 TStringField(_cdsPendencia.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=3;


_cdsPendencia.FieldByName('NROM_Y').Visible:=false;
_cdsPendencia.FieldByName('CD_EMPRESA').Visible:=false;
_cdsPendencia.FieldByName('VCCI_Y').Visible:=false;


end;
end.
