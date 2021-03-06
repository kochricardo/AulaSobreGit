unit uInativadosCadastrados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, ComCtrls, Buttons,
  uRotinasGenericas, uAuxiliarCompras;

type
  T_frmCadastradosInativados = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _cdsInativadosCadastrados: TClientDataSet;
    _dsInativadosCadastrados: TDataSource;
    _dbgInativadosCadastrados: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    _dtpDtInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    _bitFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure _btnExecutaClick(Sender: TObject);
    procedure _dbgInativadosCadastradosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _bitFecharClick(Sender: TObject);
  private
    procedure setGridInativadosCadastrados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCadastradosInativados: T_frmCadastradosInativados;

implementation

{$R *.dfm}

procedure T_frmCadastradosInativados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmCadastradosInativados.FormCreate(Sender: TObject);
begin
 _dtpDtInicio.Date := dtSistema-30;
 _dtpDtFinal.Date  := dtsistema;
end;

procedure T_frmCadastradosInativados._bitFecharClick(Sender: TObject);
begin
 close;
end;

procedure T_frmCadastradosInativados._btnExecutaClick(Sender: TObject);
begin
 _cdsInativadosCadastrados:=GetInativadosCadastrados(_dtpDtInicio.Date,_dtpDtFinal.Date,0,0);
 _dsInativadosCadastrados.DataSet:=_cdsInativadosCadastrados;
 _cdsInativadosCadastrados.Open;
 setGridInativadosCadastrados;

 if not _cdsInativadosCadastrados.IsEmpty then
 begin
    _btnExecuta.Enabled:=true;
    _btnParaExcel.Enabled:=true;
 end;

end;

procedure T_frmCadastradosInativados._btnParaExcelClick(Sender: TObject);
begin
  GerarExcel(_cdsInativadosCadastrados);
  //_btnExecuta.Enabled:=false;

end;

procedure T_frmCadastradosInativados._dbgInativadosCadastradosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   with _dbgInativadosCadastrados do
   begin

// mude a cor das Linha
   If odd(_cdsInativadosCadastrados.RecNo) then
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


// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clBlue;
         Canvas.Font.Color:= clwhite;
      end;
      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
end;

procedure T_frmCadastradosInativados.setGridInativadosCadastrados;
begin
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_COMPRADOR')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_COMPRADOR')).DisplayFormat:='###,###,##0';

  TStringField(_cdsInativadosCadastrados.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
  TStringField(_cdsInativadosCadastrados.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=20;

  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_INATIVADOS')).DisplayLabel:='Nr.Inativados';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_INATIVADOS')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_INATIVADOS')).DisplayFormat:='###,###,##0';

  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_CADASTROS_NOVOS')).DisplayLabel:='Nr.Cadastrados';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_CADASTROS_NOVOS')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_CADASTROS_NOVOS')).DisplayFormat:='###,###,##0';

  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_CPRA')).DisplayLabel:='Itens Comprados';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_CPRA')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_ITENS_CPRA')).DisplayFormat:='###,###,##0';

  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_COMPRADA')).DisplayLabel:='Unid. Compradas';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_COMPRADA')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_COMPRADA')).DisplayFormat:='###,###,##0';

  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_FORNECEDOR')).DisplayLabel:='Vlr.Compradas(P?o Fornec.)';
  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_FORNECEDOR')).DisplayWidth:=12;
  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_FORNECEDOR')).DisplayFormat:='###,###,##0.00';


  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_CUSTO')).DisplayLabel:='Vlr.Compradas(P?o.Custo)';
  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_CUSTO')).DisplayWidth:=12;
  TFloatField(_cdsInativadosCadastrados.FieldByName('VT_PCO_CUSTO')).DisplayFormat:='###,###,##0.00';

  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_PENDENTES')).DisplayLabel:='Unid. Pendentes';
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_PENDENTES')).DisplayWidth:=8;
  TIntegerField(_cdsInativadosCadastrados.FieldByName('NR_UNID_PENDENTES')).DisplayFormat:='###,###,##0';
end;

end.
