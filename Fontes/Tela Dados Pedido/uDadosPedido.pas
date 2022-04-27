unit uDadosPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DB, DBClient;

type
  T_frmDadosPedido = class(TForm)
    StatusBar1: TStatusBar;
    _cdsDadosPedido: TClientDataSet;
    _dsDadosPedido: TDataSource;
    GroupBox1: TGroupBox;
    _dbgDadosPedido: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    procedure setGridDadosPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmDadosPedido: T_frmDadosPedido;

implementation

{$R *.dfm}

procedure T_frmDadosPedido.FormActivate(Sender: TObject);
begin
  if _cdsDadosPedido<>nil then
  begin
     _dsDadosPedido.DataSet:=_cdsDadosPedido;
      _cdsDadosPedido.IndexFieldNames:='DT_EMISSAO_NFE';
     _cdsDadosPedido.Open;
     setGridDadosPedido;
  end;

end;

procedure T_frmDadosPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmDadosPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
     VK_RETURN,VK_ESCAPE : close;
  end;

end;


procedure T_frmDadosPedido.setGridDadosPedido;
begin
  TIntegerField(_cdsDadosPedido.FieldByName('NR_PEDIDO')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsDadosPedido.FieldByName('NR_PEDIDO')).DisplayWidth:=8;

  TDateField(_cdsDadosPedido.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsDadosPedido.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsDadosPedido.FieldByName('DT_PEDIDO')).DisplayWidth:=10;

  TDateField(_cdsDadosPedido.FieldByName('DT_EMISSAO_NFE')).DisplayLabel:='Emissão Nfe';
  TDateField(_cdsDadosPedido.FieldByName('DT_EMISSAO_NFE')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsDadosPedido.FieldByName('DT_EMISSAO_NFE')).DisplayWidth:=10;

  TDateField(_cdsDadosPedido.FieldByName('DT_ENTRADA_NFE')).DisplayLabel:='Entrada Nfe';
  TDateField(_cdsDadosPedido.FieldByName('DT_ENTRADA_NFE')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsDadosPedido.FieldByName('DT_ENTRADA_NFE')).DisplayWidth:=10;

  TDateField(_cdsDadosPedido.FieldByName('DT_VALIDADE')).DisplayLabel:='Validade';
  TDateField(_cdsDadosPedido.FieldByName('DT_VALIDADE')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsDadosPedido.FieldByName('DT_VALIDADE')).DisplayWidth:=10;

  TIntegerField(_cdsDadosPedido.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtde. Pedido';
  TIntegerField(_cdsDadosPedido.FieldByName('QT_PEDIDO')).DisplayWidth:=8;

  TIntegerField(_cdsDadosPedido.FieldByName('QT_ENTRADA')).DisplayLabel:='Qtde.Entrada';
  TIntegerField(_cdsDadosPedido.FieldByName('QT_ENTRADA')).DisplayWidth:=8;

  TIntegerField(_cdsDadosPedido.FieldByName('QT_SUGERIDA')).DisplayLabel:='Qtde.Sugerida';
  TIntegerField(_cdsDadosPedido.FieldByName('QT_SUGERIDA')).DisplayWidth:=8;

  TIntegerField(_cdsDadosPedido.FieldByName('NR_LEADTIME')).DisplayLabel:='LeadT. Pedido';
  TIntegerField(_cdsDadosPedido.FieldByName('NR_LEADTIME')).DisplayWidth:=8;

  TIntegerField(_cdsDadosPedido.FieldByName('NR_LEADTIME_FORN')).DisplayLabel:='LeadT Fornec';
  TIntegerField(_cdsDadosPedido.FieldByName('NR_LEADTIME_FORN')).DisplayWidth:=8;

end;
end.
